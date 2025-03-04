# https://help.mikrotik.com/docs/spaces/ROS/pages/2031625/PPPoE

/interface pppoe-client add service-name=pppoe-one user=nvercsi password=StrongPass add-default-route=yes disabled=no interface=ether1-wan1 name=pppoe-out1 use-peer-dns=yes  
# :log info "Assigning interfaces to respective interface lists.";
/interface list member add list=WAN interface=pppoe-out1 comment="defconf";
# After connecting please double check that IP/ Routes/ Route lists looks like below

# [admin@nemver] > ip route print
# Flags: D - DYNAMIC; A - ACTIVE; c - CONNECT, v - VPN
# Columns: DST-ADDRESS, GATEWAY, DISTANCE
#     DST-ADDRESS     GATEWAY     DISTANCE
# DAv 0.0.0.0/0       pppoe-out1         1
# DAc 172.22.24.0/24  bridge             0
# DAc 10.0.0.1/32     pppoe-out1         0
