# nemver config
# https://whatismyipaddress.com/ -->  62.165.199.53

# recommended wireguard listen ports: 51820 - 51900
# [2A]
/interface wireguard add listen-port=51821 mtu=1420 name=wg-s2s-nemverhome-gptoffice
# public key: OzR***FM= 

# [2B]
# [101] TUNNEL = nemverhome - gptoffice
/ip address add address=192.168.101.2/30 interface=wg-s2s-nemverhome-gptoffice network=192.168.101.0

# [5]
/interface wireguard peers 
add allowed-address=192.168.3.0/24,192.168.101.0/30,172.22.24.0/24 \
    endpoint-address=188.6.253.206 endpoint-port=51821 interface=\
    wg-s2s-nemverhome-gptoffice name=peer-s2s-nemverhome-gptoffice \
    public-key="ME/***HA="

# [6]
/ip firewall filter add action=accept chain=input comment="allow accept wg-s2s-nemverhome-gptoffice" dst-port=51821 in-interface-list=WAN protocol=udp place-before=1
/ip firewall filter add action=accept chain=forward comment="allow forward wg-s2s-nemverhome-gptoffice" in-interface=wg-s2s-nemverhome-gptoffice place-before=2

# [8]
/ip route add comment="route wg-s2s-nemverhome-gptoffice" disabled=no distance=1 dst-address=192.168.3.0/24 gateway=192.168.101.1 routing-table=main scope=30 suppress-hw-offload=no target-scope=10