# https://help.mikrotik.com/docs/spaces/ROS/pages/2031625/PPPoE

/interface pppoe-client add service-name=pppoe-one user=macskasyattila-gu9 password=StrongPass add-default-route=yes disabled=no interface=ether1-wan1 name=pppoe-out1 use-peer-dns=yes  