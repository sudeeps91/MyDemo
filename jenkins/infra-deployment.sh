cd /root/infrastructure
terraform init
echo "EXECUTING TERRAFORM PLAN"
terraform plan
echo "APPLYING CHANGES"
if [ $action = "create" ]
then
terraform apply --auto-approve
ansible_ip=`cat origHosts | grep ansible -w | cut -d '=' -f2`
chmod 400 ssh-key.pem
#mkdir ~/.kube
#copying kube config file to cicd server 
scp -i ssh-key.pem -o StrictHostKeyChecking=no ubuntu@$ansible_ip:/home/ubuntu/config ~/.kube/config
else
terraform destroy --auto-approve
fi
