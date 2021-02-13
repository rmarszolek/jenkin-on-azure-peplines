# azuregateway
ssh-keygen -m PEM -t rsa -b 4096  - for creation key pair    - name test1

ssh -i test1 azureuser@ip_address  - connection 

terraform deployig

first copy *.tf and *.sh to directory
next ssh-keygen -m PEM -t rsa -b 4096  file name test1

az login
terraform init
terraform plan 
terraform apply 

connect to VM 
ssh -i test1 azureuser@ip_address

http://ip_address:8080 - connect to Jenkins

terraform apply -var 'environmenttag=jenkins'   - change tag from null to value 
terraform apply -var 'local_ip_address=your_ip_addres'  
