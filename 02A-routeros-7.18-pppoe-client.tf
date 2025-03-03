# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_pppoe_client

resource "routeros_interface_pppoe_client" "test" {
  interface    = "ether1"
  password     = "StrongPass"
  service_name = "pppoeservice"
  name         = "PPPoE-Out"
  disabled     = false
  user         = "MT-User"
}