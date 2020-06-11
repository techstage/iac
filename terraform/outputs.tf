# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.vpc.vpc_id}"
}

# Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = ["${module.vpc.private_subnets}"]
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = ["${module.vpc.public_subnets}"]
}

# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = ["${module.vpc.nat_public_ips}"]
}

# List of public DNS names assigned to the instances
output "public_dns" {
  description = "List of public DNS names assigned to the instances"
  value       = module.ec2.public_dns[0]
}

# List instance ID
output "instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.id[0]
}