# https://help.mikrotik.com/docs/display/ROS/Wireless

/interface wireless security-profiles
  add name=myProfile authentication-types=wpa2-psk mode=dynamic-keys \
    wpa2-pre-shared-key=setup1.setup1

#installation indoors 
#country hungary
/interface wireless
  enable wlan1;
  set wlan1 band=2ghz-b/g/n channel-width=20/40mhz-Ce distance=indoors \
    mode=ap-bridge ssid=GuppyNet2 wireless-protocol=802.11 \
    security-profile=myProfile frequency-mode=regulatory-domain 