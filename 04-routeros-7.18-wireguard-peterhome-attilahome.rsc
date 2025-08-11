# karpet config
# https://whatismyipaddress.com/ -->  89.135.98.22

# recommended wireguard listen ports: 51820 - 51900
# [2A]
/interface wireguard add listen-port=51822 mtu=1420 name=wg-s2s-peterhome-attilahome
# public key: NKj***Rg=

# [2B]
# [101] TUNNEL = peterhome - attilahome
/ip address add address=192.168.102.2/30 interface=wg-s2s-peterhome-attilahome network=192.168.102.0

# [5]
/interface wireguard peers 
add allowed-address=192.168.102.0/30,172.22.22.0/24,172.22.23.0/24 \
    endpoint-address=46.139.14.94 endpoint-port=51822 interface=\
    wg-s2s-peterhome-attilahome name=peer-s2s-peterhome-attilahome \
    public-key="Dxa***WE="

# [6]
/ip firewall filter add action=accept chain=input comment="allow accept wg-s2s-peterhome-attilahome" dst-port=51822 in-interface-list=WAN protocol=udp place-before=1
/ip firewall filter add action=accept chain=forward comment="allow forward wg-s2s-peterhome-attilahome" in-interface=wg-s2s-peterhome-attilahome place-before=2

# [8]
/ip route add comment="route wg-s2s-peterhome-attilahome" disabled=no distance=1 dst-address=172.22.22.0/24 gateway=192.168.102.1 routing-table=main scope=30 suppress-hw-offload=no target-scope=10