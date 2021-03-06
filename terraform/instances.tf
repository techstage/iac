locals {
    user_data = <<EOF
    #!/bin/bash
    echo "Hello Terraform!"
    EOF
}

module "ec2" {
  source                        = "terraform-aws-modules/ec2-instance/aws"

  instance_count                = 1

  name                          = "techstage-instace"
  ami                           = "ami-09d95fab7fff3776c"
  instance_type                 = "t2.micro"
  key_name                      = "techstage"
  subnet_id                     = module.vpc.public_subnets[0]
  associate_public_ip_address   = true
  vpc_security_group_ids        = [module.security_group.this_security_group_id]

  user_data_base64 = base64encode(local.user_data)

  tags = {
    "Environment"      = "dev"
  }
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"

  name        = "techstage-sg"
  description = "Security group example"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}

# generate inventory file for Ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/templates/hosts.tpl",
    {
      instances = module.ec2.public_ip
    }
  )
  filename = "../ansible/inventory/hosts.cfg"
}