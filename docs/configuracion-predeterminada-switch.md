# Configuración Predeterminada de Switch Cisco

## 1. Ingresando al "Modo EXEC Privilegiado"

```cisco
Switch> enable
Switch#
```

## 2. Examinar la Configuración Actual del Switch

```cisco
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
```

## 3. Crear una Configuración Básica del Switch

### 3.1 Asignando un Nombre al Switch

```cisco
Switch# configure terminal
Switch(config)# hostname S1
S1(config)# exit
S1#
```

## 4. Acceso Seguro a la Consola

> **Nota:** Esto es para acceder a la primera interfaz CLI. La contraseña aquí es **falsa** y solo para ejemplo.

```cisco
S1# configure terminal
S1(config)# line console 0
S1(config-line)# password letmein
S1(config-line)# login
S1(config-line)# exit
S1(config)# exit
```

## 5. Acceso Seguro al Modo Privilegiado

> **Importante:** Debes completar todos estos pasos para que el acceso al modo privilegiado esté completamente asegurado. La contraseña aquí es **falsa**.

```cisco
S1> enable
S1# configure terminal
S1(config)# enable password c1$c0
S1(config)# exit
S1#
```

### 5.1 Verificando que el Acceso sea Seguro

```cisco
S1# exit

Verificacion de acceso del usuario
Password:
```

> **Aclaración:**
> - La primera contraseña es la que configuramos para `line console 0` = `letmein`
> - Al ingresar `enable` se debe usar la 2da contraseña = `c1$c0`

```cisco
S1# show running-config
```

## 6. Encriptación de Contraseñas

> **Problema:** Hasta aquí las 2 contraseñas están en **texto plano**. Se pueden ver en el archivo de configuración, lo cual es un riesgo de seguridad. Necesitamos encriptarlas.

### 6.1 Configurar Contraseña Encriptada para Modo Privilegiado

```cisco
S1# config t
S1(config)# enable secret itsasecret
S1(config)# exit
S1#
```

### 6.2 Verificar la Contraseña en el Archivo de Configuración

```cisco
S1# show running-config
```

> **Nota:** Ahora la contraseña "secret" está encriptada. Las otras 2 contraseñas: una se ve en texto plano y la otra no se ve pero tampoco está encriptada.

### 6.3 Encriptar Todas las Contraseñas

```cisco
S1# config t
S1(config)# service password-encryption
S1(config)# exit
S1# show running-config
```

> **Información:** El servicio `password-encryption` ahora está **ACTIVO**. Las contraseñas que se habían configurado sin encriptación ahora lo están, pero aparecerá una marca indicando que "no se crearon encriptadas" originalmente.

## 7. Configurar un Aviso de MOTD (Mensaje del Día)

Cisco IOS permite configurar mensajes que cualquier usuario verá al iniciar sesión en el switch.

```cisco
S1# config t
S1(config)# banner motd "This is a secure system. Authorized Access Only!"
S1(config)# exit
S1#
```

## 8. Guardar la Configuración en NVRAM

La configuración del switch puede copiarse a NVRAM para que los cambios **no se pierdan** después de apagar o reiniciar el dispositivo.

```cisco
S1# copy running-config startup-config
Destination filename [startup-config]?[Enter] 
Building configuration...
[OK]
```

---

**Resumen de la configuración segura completada:**
- ✅ Nombre del switch configurado
- ✅ Acceso seguro a la consola
- ✅ Acceso seguro al modo privilegiado
- ✅ Contraseñas encriptadas
- ✅ MOTD configurado
- ✅ Configuración guardada en NVRAM
