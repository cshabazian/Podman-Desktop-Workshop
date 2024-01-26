#!/bin/sh

# This script will take the yaml file from the lab setup and create an inventory file that can then be used to run a playbook on all individual
# Environments in the workshop

[[ ! -f ansible-playbook ]] && echo "Ansible doesn't appear to be installed.  Please install and rerun this script" && exit
echo "after test"
read -p "Enter the name of the yaml file you have retrived from the workshop setup (default lab.yml): " SOURCE_FILE
echo "after read"
: ${SOURCE_FILE:=lab.yml}

[[ ! -f ${SOURCE_FILE} ]] && echo "${SOURCE_FILE} doesn't exist.  Please download it and rerun this script" && exit

read -p "Enter the name of the inventory file you wish to create from ${SOURCE_FILE} (default workshop): " INVENTORY_FILE
: ${INVENTORY_FILE:=workshop}

echo "[LAB]" > ${INVENTORY_FILE}

grep "student@bastion" ${SOURCE_FILE} | grep password | awk -F ',' '{print $1,$2}' | grep -v when | sed 's/\"//g' | sed 's/ssh_password://g' | awk '{print $1,"ansible_user=student","ansible_ssh_pass="$2'} | sed "s/$/\ ansible_ssh_common_args='-o StrictHostKeyChecking=no'/" | cut -d "@" -f 2 >> ${INVENTORY_FILE}

echo "The inventory file has been saved to ${INVENTORY_FILE}"

read -p  -n 1 "Do you wish to run the playbook and install Podman Desktop on the workshop systems now: " INSTALL_OK
if [ "${INSTALL_OK^^" = "Y" ] ; then
FORKS=$(wc ${INVENTORY_FILE})
ansible-playbook -i workshop.txt -f ${FORKS} install_pdw.yml
else
echo "You can run the playbook by using: ansible-playbook -i workshop.txt -f ${FORKS} install_pdw.yml"
fi
