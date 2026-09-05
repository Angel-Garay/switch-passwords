# switch-passwords
Repo donde dejo escrito como configurar contraseñas para Switchs

## Contenido

Este repositorio documenta la configuración segura de contraseñas en **Switches Cisco IOS**.

### Configuración Predeterminada de Switch

Guía paso a paso que cubre:

- **Acceso a Modo Privilegiado**: Habilitación del modo EXEC privilegiado con comando `enable`.
- **Seguridad de Consola**: Configuración de contraseña para acceso inicial con `line console 0`.
- **Protección del Modo Privilegiado**: Implementación de contraseña con `enable password` y `enable secret`.
- **Encriptación de Contraseñas**: Activación del servicio `password-encryption` para cifrar credenciales en la configuración.
- **Banner MOTD**: Configuración de mensaje de bienvenida para advertencias de acceso.
- **Almacenamiento en NVRAM**: Guardado de cambios con `copy running-config startup-config` para persistencia.

Todas las contraseñas en los ejemplos son ficticias.

