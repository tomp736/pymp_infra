#!/bin/bash

# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`
TERRAFORM_PATH=$SCRIPTPATH/terraform
ANSIBLE_PATH=$SCRIPTPATH/ansible

echo Terraform Path: $TERRAFORM_PATH
echo Ansible Path: $ANSIBLE_PATH

yes | cp ../terraform -r .
yes | cp ../ansible -r .

# sed -i 's|?ref=main|?ref=dev|g' terraform/main.tf
# sed -i 's|version: main|version: dev|g' ansible/requirements.yml

cd $TERRAFORM_PATH

terraform init --upgrade
terraform destroy --var-file=default.tfvars -input=false
