# attilahome config
# https://whatismyipaddress.com/ --> 46.139.14.94

# recommended wireguard listen ports: 51820 - 51900
# [1A]
/interface wireguard add listen-port=51823 mtu=1420 name=wg-s2s-attilahome-gptoffice
# public key: alh***hg=

# [1B]
# [103] TUNNEL = attilahome - gptoffice
/ip address add address=192.168.103.1/30 interface=wg-s2s-attilahome-gptoffice network=192.168.103.0

# [3]
/interface wireguard peers
add allowed-address=192.168.103.0/30,172.22.22.0/24,172.22.19.0/24,172.22.25.0/24,172.22.26.0/24 \
    endpoint-address=188.6.253.206 endpoint-port=51823 interface=\
    wg-s2s-attilahome-gptoffice name=peer-s2s-attilahome-gptoffice \
    public-key="Uf3***SE="

# [4]
/ip firewall filter add action=accept chain=input comment="allow input wg-s2s-attilahome-gptoffice" dst-port=51823 in-interface-list=WAN protocol=udp place-before=1
/ip firewall filter add action=accept chain=forward comment="allow forward wg-s2s-attilahome-gptoffice" in-interface=wg-s2s-attilahome-gptoffice place-before=2

# [7] Routes for all allowed networks
/ip route add comment="route wg-s2s-attilahome-gptoffice-net22" disabled=no distance=1 dst-address=172.22.22.0/24 gateway=192.168.103.2 routing-table=main scope=30 suppress-hw-offload=no target-scope=10
/ip route add comment="route wg-s2s-attilahome-gptoffice-net19" disabled=no distance=1 dst-address=172.22.19.0/24 gateway=192.168.103.2 routing-table=main scope=30 suppress-hw-offload=no target-scope=10
/ip route add comment="route wg-s2s-attilahome-gptoffice-net25" disabled=no distance=1 dst-address=172.22.25.0/24 gateway=192.168.103.2 routing-table=main scope=30 suppress-hw-offload=no target-scope=10
/ip route add comment="route wg-s2s-attilahome-gptoffice-net26" disabled=no distance=1 dst-address=172.22.26.0/24 gateway=192.168.103.2 routing-table=main scope=30 suppress-hw-offload=no target-scope=10



