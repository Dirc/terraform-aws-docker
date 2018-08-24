# Terraform + AWS + Docker Swarm setup
Based on: https://github.com/Praqma/terraform-aws-docker


Create Docker Swarm cluster on AWS using Terraform. 
Default cluster consist of 1 manager and 2 workers, all on `t2.micro` free tier AWS servers.


## Prerequisites
- AWS account 
- ACCESS and SECRET key in `~/.aws/credentials` file
- SSH keys

Before to start, create ssh keys. 
Terraform will create key-pair in AWS, based on these keys. 
See [how to create ssh keys](https://confluence.atlassian.com/bitbucketserver/creating-ssh-keys-776639788.html)
Create a pem file with private ssh key you generated. 
Terraform will need to the pem file to connect to instances for provisioning.


### Update the project file with new information
Update the files
- *key-pair.tf* 
- *variables.tf* 
- *app-instances.tf* update connection block for each resources, set there the path to ssh private key.    



## How to use

```
terraform plan
terraform apply
terraform destroy
```

## Swarm demo
Very nice Swarm demo:
https://github.com/dockersamples/example-voting-app



## ToDo

Update README with steps to make it work
- [ ] Generate key pair: ssh-keygen
- [ ] key-pairs.tf: add public_key_path
- [ ] app-instances.tf: 
  - key_file should be: private_key = "${file("terraform_aws_key.pem")}"
  - For the slaves.provisioner.file.source: "terraform_aws_key.pem"
- [ ] Remove all sudo docker, since ubuntu user is part of the docker group
- [ ] Bug: Docker version 18+ is not installed, due to dpkg resource in use?
