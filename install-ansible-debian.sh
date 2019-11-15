#run this file with the command:
#https://github.com/mateusz-gladczak/ansible/install-ansible-debian.sh | /bin/sh -

#!/bin/bash
apt install ansible python3-pip python-dev libkrb5-dev krb5-user
pip3 install pywinrm[kerberos]
pip3 install pykerberos --upgrade
pip3 install requests-kerberos --upgrade
echo "-----------------------------------------------------"
echo "configure /etc/krb5.conf for kerberos authentication"
echo "-----------------------------------------------------"
echo ""
echo ""
echo ""
echo "        default_realm = NWTRADERS.MSFT"
echo""
echo "[realms]"
echo "        NWTRADERS.MSFT = {"
echo "                kdc = DC1.NWTRADERS.MSFT"
echo "                admin_server = DC1.NWTRADERS.MSFT"
echo "        }
echo "        TALSPINTOYS.COM = {"
echo "                kdc = DC1.TALSPINTOYS.COM"
echo "                admin_server = DC1.TALSPINTOYS.COM"
echo "       }"
echo ""
echo "[domain_realm]"
echo "        .nwtraders.msft = NWTRADERS.MSFT"
echo "        nwtraders.msft = NWTRADERS.MSFT"
echo "        .talspintoys.com = TALSPINTOYS.COM"
echo "        talspintoys.com = TALSPINTOYS.COM"
echo ""
echo "-----------------------------------------------------"
echo "Initialilze kerberos ticket:
echo "kinit user@<DOMAIN_REALM>"
echo ""
echo "-----------------------------------------------------"
echo "Use variables in ansible hosts:
echo ""
echo "[<hosts group>:vars]"
echo "ansible_user = user@<DOMAIN_REALM>"
echo "ansible_connection = winrm"
echo "ansible_port = 5985"
echo "ansible_winrm_transport = kerberos"
