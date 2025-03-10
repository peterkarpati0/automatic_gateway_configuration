# Testing the official Terraform provider without certificates (HTTP, insecure = true)

# This setup is not secure and is only for testing purposes.
# TODO: Implement certificate-based API access and securely store credentials using ROS or MIKROTIK environment variables.

# /interface pppoe-client add add-default-route=yes disabled=no interface=ether1-wan1 name=pppoe-out1 use-peer-dns=yes user=attila-macskasy-one password=setup1 service-name=pppoe-one

# $env:ROS_HOSTURL="api://172.22.22.108"
# $env:ROS_USERNAME="admin"
# $env:ROS_PASSWORD="yourpassword"

# export ROS_HOSTURL="api://172.22.22.108"
# export ROS_USERNAME="admin"
# export ROS_PASSWORD="yourpassword"

terraform {
  required_providers {
    routeros = {
      source  = "terraform-routeros/routeros"
    }
  }
}

provider "routeros" {
  hosturl        = "http://172.22.24.254"        # env ROS_HOSTURL or MIKROTIK_HOST
  #hosturl  = "api://172.22.22.254"              # Use 'api://' for API connections
  username       = "admin"                       # env ROS_USERNAME or MIKROTIK_USER
  password       = "setup1"                      # env ROS_PASSWORD or MIKROTIK_PASSWORD
  #ca_certificate = "cert_export_client1.crt"    # env ROS_CA_CERTIFICATE or MIKROTIK_CA_CERTIFICATE
  insecure = true                                # Set to false if using HTTPS
}

# If you only want to retrieve the identity name, this provider does not support it as a data source.
# However, if you want to set the identity name, update your Terraform script as follows:
# Set system identity (name of the router)
resource "routeros_system_identity" "router" {
  name = "petinemvermacskat"  # Change this to the desired router name
}

output "router_identity" {
  value = routeros_system_identity.router.name
}
