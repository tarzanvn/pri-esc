#  Abusing Service Misconfigurations

- get configuration of a service
    ```cmd
    # sc qc apphostsvc
    sc qc apphostsvc
    ```
    - output:  
        ```
        SERVICE_NAME: apphostsvc
        TYPE               : 20  WIN32_SHARE_PROCESS
        START_TYPE         : 2   AUTO_START
        ERROR_CONTROL      : 1   NORMAL
        BINARY_PATH_NAME   : C:\Windows\system32\svchost.exe -k apphost
        LOAD_ORDER_GROUP   :
        TAG                : 0
        DISPLAY_NAME       : Application Host Helper Service
        DEPENDENCIES       :
        SERVICE_START_NAME : localSystem
        ```
        - BINARY_PATH_NAME: the starting commandline
        - SERVICE_START_NAME: the account used to run the service 


## Insecure Permissions on Service Executable

when attacker can modify or replace the excecutable of service.

- check permission of a file
    ```cmd
    # icacls [path_to_file]
    icacls C:\PROGRA~2\SYSTEM~1\WService.exe
    ```

## Unquoted Service Paths

- When we can't directly write into service executables as before, there might still be a chance to force a service into running arbitrary executables by using a rather obscure feature. It when the path to executable file contains space character and the declearing of services not contains the quote. (exp: C:\Program Files\RealVNC\VNC Server\vncserver.exe).
- by default app installed in "C:\Program File" that unpri-usr don't have the permission. By sometimes, they are installed in other custom place, that the user have permission.
- similar vector with PATH of linux.

## Insecure Service Permissions

- To check for a service DACL from the command line, you can use [Accesschk](https://docs.microsoft.com/en-us/sysinternals/downloads/accesschk) from the Sysinternals suite.

- check service's DACL:
    ```cmd
    # accesschk64.exe -qlc [service_name]
    accesschk64.exe -qlc thmservice
    ```

- restart service
    ```cmd
    sc start [scv_name]
    sc stop [scv_name]
    ```