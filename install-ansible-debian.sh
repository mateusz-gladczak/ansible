#!/bin/bash
#run this file with the command:
#curl https://raw.githubusercontent.com/mateusz-gladczak/ansible/master/install-ansible-debian.sh | /bin/sh -

apt install ansible python3-pip python-dev libkrb5-dev krb5-user -y
pip3 install pywinrm[kerberos]
pip3 install pykerberos --upgrade
pip3 install requests-kerberos --upgrade
pip3 install requests --upgrade

cat << EOF

-----------------------------------------------------
configure /etc/krb5.conf for kerberos authentication
-----------------------------------------------------

        default_realm = NWTRADERS.MSFT

[realms]
        NWTRADERS.MSFT = {
                kdc = DC1.NWTRADERS.MSFT
                admin_server = DC1.NWTRADERS.MSFT
        }
        TALSPINTOYS.COM = {
                kdc = DC1.TALSPINTOYS.COM
                admin_server = DC1.TALSPINTOYS.COM
       }

[domain_realm]
        .nwtraders.msft = NWTRADERS.MSFT
        nwtraders.msft = NWTRADERS.MSFT
        .talspintoys.com = TALSPINTOYS.COM
        talspintoys.com = TALSPINTOYS.COM

-----------------------------------------------------
Initialilze kerberos ticket:
kinit user@<DOMAIN_REALM>

-----------------------------------------------------
Use variables in ansible hosts files:

[<hosts group>:vars]
ansible_user = user@<DOMAIN_REALM>
ansible_connection = winrm
ansible_port = 5985
ansible_winrm_transport = kerberos
EOF
