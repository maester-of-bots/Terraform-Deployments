# Terraform Deployment Examples

## Contents
* [Linux App Server on Azure](Azure/App_Server)
* [Postgres Databsae Server on Azure](Azure/DB_Server)
* [CentOS 7 template to ESXI](ESXI/CentOS_7)
* [Rocky 9 template to Proxmox](Proxmox/Rocky_9) 


# Setup
```
sudo apt install wget unzip

wget https://releases.hashicorp.com/terraform/1.5.4/terraform_1.5.4_linux_arm.zip
unzip terraform_1.5.4_linux_amd64.zip
cd terraform_1.5.4_linux_amd64
mv terraform /usr/local/bin
```

Must install Azure command line for Azure deployments - [Download here](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)


# References
[Proxmox Terraform Info](https://dev.to/r0psteev/learning-some-terraform-for-proxmox-3ff4)

[Postgres DB reference link](https://learn.microsoft.com/en-us/azure/developer/terraform/deploy-postgresql-flexible-server-database?tabs=azure-cli)



