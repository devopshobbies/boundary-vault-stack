## create ignored dirs in git for confidential data
mkdir -p logs/ secrets/

ansible-playbook -i ansible/inventory/inventory.ini ansible/playbook.yml --ask-vault-pass
## wait 10 seconds for the vault changes to take effect
sleep 10
ansible-playbook -i ansible/inventory/inventory.ini ansible/terraform.yml --ask-vault-pass 
sleep 5
ansible-playbook -i ansible/inventory/inventory.ini ansible/boundary.yml --ask-vault-pass