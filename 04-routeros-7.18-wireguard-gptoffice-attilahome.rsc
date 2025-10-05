# gptoffice config
# https://whatismyipaddress.com/ --> 188.6.253.206

# recommended wireguard listen ports: 51820 - 51900
# [2A]
/interface wireguard add listen-port=51823 mtu=1420 name=wg-s2s-gptoffice-attilahome
# public key: Uf3***SE=

# [2B]
# [103] TUNNEL = gptoffice - attilahome
/ip address add address=192.168.103.2/30 interface=wg-s2s-gptoffice-attilahome network=192.168.103.0

# [5]
/interface wireguard peers 
add allowed-address=192.168.103.0/30,172.22.16.0/24,172.22.18.0/24,172.22.20.0/24,172.22.21.0/24,172.22.22.0/24 \
    endpoint-address=46.139.14.94 endpoint-port=51823 interface=\
    wg-s2s-gptoffice-attilahome name=peer-s2s-gptoffice-attilahome \
    public-key="alh***hg="

# [6]
/ip firewall filter add action=accept chain=input comment="allow input wg-s2s-gptoffice-attilahome" dst-port=51823 in-interface-list=WAN protocol=udp place-before=1
/ip firewall filter add action=accept chain=forward comment="allow forward wg-s2s-gptoffice-attilahome" in-interface=wg-s2s-gptoffice-attilahome place-before=2

# [8] Routes for all allowed networks from Attila's side
/ip route add comment="route wg-s2s-gptoffice-attilahome-net16" disabled=no distance=1 dst-address=172.22.16.0/24 gateway=192.168.103.1 routing-table=main scope=30 suppress-hw-offload=no target-scope=10
/ip route add comment="route wg-s2s-gptoffice-attilahome-net18" disabled=no distance=1 dst-address=172.22.18.0/24 gateway=192.168.103.1 routing-table=main scope=30 suppress-hw-offload=no target-scope=10
/ip route add comment="route wg-s2s-gptoffice-attilahome-net20" disabled=no distance=1 dst-address=172.22.20.0/24 gateway=192.168.103.1 routing-table=main scope=30 suppress-hw-offload=no target-scope=10
/ip route add comment="route wg-s2s-gptoffice-attilahome-net21" disabled=no distance=1 dst-address=172.22.21.0/24 gateway=192.168.103.1 routing-table=main scope=30 suppress-hw-offload=no target-scope=10
/ip route add comment="route wg-s2s-gptoffice-attilahome-net22" disabled=no distance=1 dst-address=172.22.22.0/24 gateway=192.168.103.1 routing-table=main scope=30 suppress-hw-offload=no target-scope=10