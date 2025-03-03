
# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/system_script

# source =  routeros-7.18-smips-01_nemver.rsc

resource "routeros_system_script" "script" {
  name   = "my_script"
  source = <<EOF
    :log info "This is a test script created by Terraform."
    EOF
  policy = ["read", "write", "test", "policy"]
}




