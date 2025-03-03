# https://wiki.mikrotik.com/Manual:Create_Certificates

/certificate
add name=ca-template common-name=myCa key-usage=key-cert-sign,crl-sign
add name=server-template common-name=server
add name=client1-template common-name=client1

/certificate 
sign ca-template ca-crl-host=10.5.101.16 name=myCa
sign server-template ca=myCa name=server
sign client1-template ca=myCa name=client1

#/certificate 
#sign server-template ca=myCa name=server

/certificate
set myCa trusted=yes
set server trusted=yes

/certificate export-certificate myCa
/certificate export-certificate client1 export-passphrase=setup1setup1


