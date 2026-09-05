#Ingresando al "modo EXEC privilegiado"
	Switch> enable
	Switch#


#Examinar la configuracion actual del switch
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


#Creando una configuracion basica del switch
#Asignando un nombre al switch
	Switch# configure terminal
	Switch(config)# hostname S1
	S1(config)# exit
	S1#


#Acceso seguro a la consola
#Comentario propio: esto es para acceder a la primera interfaz CLI y la contraseña es falsa
	S1# configure terminal
	S1(config)# line console 0
	S1(config-line)# password letmein
	S1(config-line)# login
	S1(config-line)# exit
	S1(config)# exit


#Ahora el acceso seguro es al modo privilegiado
#Poniendo contraseña (claro que es falsa), hay que completar todos los pasos siguientes para que recien este asegurado
	S1> enable
	S1# configure terminal
	S1(config)# enable password c1$c0
	S1(config)# exit
	S1#


#Verificando que el acceso al modo privilegiado sea seguro
	S1# exit
	Verificacion de acceso del usuario
	Password:


#Aca la primera contraseña es la que hicimos para "line con 0" = letmein
#Luego poniendo enable se tiene que ingresar la 2da contraseña = c1$c0
	S1# show running-config


#Hasta aca las 2 contraseñas son texto plano, se tienen que encriptar
#Porque estoy viendo la contraseña que use para enable "modo EXEC privilegiado"


#Configurando una contraseña encriptada para promocionar acceso seguro al modo privilegiado
	S1# config t
	S1(config)# enable secret itsasecret
	S1(config)# exit
	S1#


#Verificando si la contraseña de enable secret se agrego al archivo de configuracion
	S1# show running-config


#Ahora lo que se ve es la contraseña "secret" encriptada, las otras 2 contraseñas solo 1 se ve en texto plano, y la otra no la veo pero tampoco esta encriptada


#Encripte las contraseñas de consola y de enable
	S1# config t
	S1(config)# service password-encryption
	S1(config)# exit
	S1# show running-config


#Aca lo que va a mostrar es que el servicio ESTA ACTIVO el de password-encryption
#Y la contraseña "password" que se activo sin encriptacion ahora lo esta pero marca que "no se creo encriptada"


#Configurando un aviso de MOTD (mensaje del dia)
#Cisco IOS permite configurar los mensajes que cualquier persona puede ver al iniciar sesion en el switch: MOTD
	S1# config t
	S1(config)# banner motd "This is a secure system. Authorized Access Only!"
	S1(config)# exit
	S1#


#Guardando archivos de configuracion en NVRAM
#La configuracion basica del switch se puede hacer una copia de seguridad a NVRAM.
#Se hace para que los cambios hechos no se pierdan luego de apagar o reiniciar
	S1# copy running-config startup-config
	Destination filename [startup-config]?[Enter] 
	Building configuration...
	[OK]

