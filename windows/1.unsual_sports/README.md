# Harvesting Passwords from Usual Spots

in short, it is enum to get the creds on files, configs, history, saved info,...

## Unattended 
files to check:

  - C:\Unattend.xml
  - C:\Windows\Panther\Unattend.xml
  - C:\Windows\Panther\Unattend\Unattend.xml
  - C:\Windows\system32\sysprep.inf
  - C:\Windows\system32\sysprep\sysprep.xml

sample info
  ```xml
  <Credentials>
    <Username>Administrator</Username>
    <Domain>thm.local</Domain>
    <Password>MyPassword123</Password>
  </Credentials>
  ```


## Powershell History

```cmd
type %userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
```
*note*: this work with **cmd** only.

## Saved Windows Credentials
```cmd
# get list 
cmdkey /list

# run program with the saved key
runas /savecred /user:admin cmd.exe
```

## IIS Configuration

- C:\inetpub\wwwroot\web.config
- C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config\web.config

Here is a quick way to find database connection strings on the file:

```cmd
type C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config\web.config | findstr connectionString
```

## Retrieve Credentials from Software: PuTTY
```cmd
reg query HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\ /f "Proxy" /s
```