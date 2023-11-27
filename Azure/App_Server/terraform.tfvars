subscription_id = ""
client_id = ""
client_secret = ""
tenant_id = ""

resource_group = "TGS-Cloud-1"
zone = "East US"

network_name = "vm-vnet"
address_space = "10.11.0.0/16"

subnet_name = "vm-subnet"
subnet_space = "10.11.1.0/24"

public_ip_name = "vm-public-ip"
public_ip_type = "Static"

nsg_name = "vm-nsg"

remote_access_type = "vm-ssh-rule"
remote_access_port = "22"
allowed_IP = ""

nic_name = "vm-nic"

VM_Name = "TGS-PRD-Cloud01"
VM_Size = "Standard_B2s"

admin_user = "TGSAdmin"
admin_password = ""

disk_size = 30

os_publisher = "debian"
os_offer = "debian-10"
os_sku = "10"
os_version = "latest"