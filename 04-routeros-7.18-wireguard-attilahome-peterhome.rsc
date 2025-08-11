# attilahome config
# https://whatismyipaddress.com/ --> 46.139.14.94

# recommended wireguard listen ports: 51820 - 51900
# [1A]
/interface wireguard add listen-port=51822 mtu=1420 name=wg-s2s-attilahome-peterhome
# public key: Dxa***WE=

# [1B]
# [102] TUNNEL = attilahome - peterhome
/ip address add address=192.168.102.1/30 interface=wg-s2s-attilahome-peterhome network=192.168.102.0

# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_wireguard

# resource "routeros_interface_wireguard" "test_wg_interface" {
#   name        = "test_wg_interface"
#   listen_port = "13231"
# }

# mtu (String) Layer3 Maximum transmission unit ('auto', 0 .. 65535)
# !!! Terraform Output !!! --> public_key (String) A base64 public key is calculated from the private key.

# [3]
/interface wireguard peers
add allowed-address=192.168.102.0/30,172.22.22.0/24,172.22.23.0/24 \
    endpoint-address=89.135.98.22 endpoint-port=51822 interface=\
    wg-s2s-attilahome-peterhome name=peer-s2s-attilahome-peterhome \
    public-key="NKj***Rg="

# https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs/resources/interface_wireguard_peer

# resource "routeros_interface_wireguard_peer" "wg_peer" {
#   interface  = routeros_interface_wireguard.test_wg_interface.name
#   public_key = "MY_BASE_64_PUBLIC_KEY"
#   allowed_address = [
#     "192.168.0.0/16",
#     "172.16.0.0/12",
#     "10.0.0.0/8",
#   ]
# }

# endpoint_address (String) An endpoint IP or hostname can be left blank to allow remote connection from any address.
# endpoint_port (String) An endpoint port can be left blank to allow remote connection from any port.

# [4]
/ip firewall filter add action=accept chain=input comment="allow input wg-s2s-attilahome-peterhome" dst-port=51822 in-interface-list=WAN protocol=udp place-before=1
/ip firewall filter add action=accept chain=forward comment="allow forward wg-s2s-attilahome-peterhome" in-interface=wg-s2s-attilahome-peterhome place-before=2

#place-before=1: This ensures that the rule is placed before the current second rule, effectively making it the second rule in the list.
#The numbering in MikroTik starts from 0, so place-before=1 places it right after the first rule.

#If the rule already exists and you want to move it to the second position, use:
#/ip firewall filter move [find comment="allow wg-s2s-attilahome-peterhome"] 1

# [7]
/ip route add comment="route wg-s2s-attilahome-peterhome" disabled=no distance=1 dst-address=172.22.23.0/24 gateway=192.168.102.2 routing-table=main scope=30 suppress-hw-offload=no target-scope=10



