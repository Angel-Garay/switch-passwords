!Ingresando al "modo EXEC privilegiado"

Switch> enable
Switch#


!Examinar la configuracion actual del switch

Switch# show running-config

   Building configuration...

   Current configuration : 1080 bytes
   !
   version 15.0
   no service timestamps log datetime msec
   no service timestamps debug datetime msec
   no service password-encryption
   !
   hostname Switch
   !
   !spanning-tree mode pvst
   spanning-tree extend system-id
   !
   interface FastEthernet0/1
   !
   interface FastEthernet0/2


!Creando una configuracion basica del switch
!Asignando un nombre al switch

Switch# configure terminal
Switch(config)# hostname S1
S1(config)# exit
S1#


!Acceso seguro a la consola
!Comentario propio: esto es para acceder a la primera interfaz CLI

S1# configure terminal
S1(config)# line console 0
S1(config-line)# password letmein
S1(config-line)# login
S1(config-line)# exit
S1(config)# exit

