#!/bin/bash

echo "Starting ansible..."

PUBLIC_DNS=$(terraform output public_dns)

ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i ../ansible/inventory/hosts.cfg -u ec2-user --private-key techstage.pem ../ansible/techstage-playbook.yml -e "public_dns=$PUBLIC_DNS"