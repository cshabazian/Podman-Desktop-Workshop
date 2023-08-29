#!/bin/sh
[[ "$EUID" -ne 0 ]] && echo "Please run as root" && exit
[[ -d /root/RHEL9-Workshop/config/ || mkdir -p /root/RHEL9-Workshop/config/
[[ -f /root/RHEL9-Workshop/config/gpte-studentpw.txt ]] || echo "student" > /root/RHEL9-Workshop/config/gpte-studentpw.txt
[[ -f /root/RHEL9-Workshop/config/gpte-targethost.txt ]] || echo "node1.example.com" > /root/RHEL9-Workshop/config/gpte-targethost.txt
ansible-galaxy collection install community.crypto ansible.posix community.general
ansible-playbook ./ansible/setup_workshop_novnc.yml -i node1.example.com,
