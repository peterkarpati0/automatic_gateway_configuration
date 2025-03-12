# https://wiki.mikrotik.com/Manual:IP/DHCP_Client
#Some service providers reqires DHCP client to be enabled on the interface to get the IP address to access the internet
#Depending on the IP address you get there are two scenarios:
#1. If you get a public IP address, you can use the default route to access the internet
#2. If you get a private IP address, it means you are behind the NAT so additional port forwarding is required on 4G/LTE or 5G modem
/ip dhcp-client add interface=ether1-wan1 disabled=no use-peer-dns=yes use-peer-ntp=yes


# TODO: research how to disable unecesseary NAT on 4G/LTE or 5G modem in order to get public IP address on ether2-wan2 directly
# 