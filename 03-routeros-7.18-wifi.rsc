# https://help.mikrotik.com/docs/spaces/ROS/pages/224559120/WiFi

# Creating a security profile, which will be common for both interfaces
/interface wifi security
add name=common-auth authentication-types=wpa2-psk,wpa3-psk passphrase="setup1.wifi" wps=disable

# Creating a common configuration profile and linking the security profile to it
/interface wifi configuration
add name=common-conf ssid=GuppyNet country=Hungary security=common-auth

# Creating separate channel configurations for each band
/interface wifi channel
add name=ch-2ghz frequency=2412,2432,2472 width=20mhz
add name=ch-5ghz frequency=5180,5260,5500 width=20/40/80mhz

# Assigning to each interface the common profile as well as band-specific channel profile, in case of "no supported channels" message on interfaces, make sure that correct (channel) configuration is applied to each.
/interface wifi
set wlan1 channel=ch-5ghz configuration=common-conf disabled=no
set wlan2 channel=ch-2ghz configuration=common-conf disabled=no

# "print detail" will show all values that interface will use, including inherited ones
# using "print detail config" will show only the values that were directly configured on the interface
# interface/wifi/print detail config  
