# nfs

Network File Sharing that keep in `/etc/exports`

## enum

- enumerating mountable shares from our attacking machine
  ```bash
    # showmount -e [target_ip]
    showmount -e 10.10.181.33
  ```

- mount share folder
  ```bash
  # mount -o rw [target_ip]:[target_folder] [local_folder_2_mount]
  mount -o rw 10.10.181.33:/backups /tmp/backupOnMyLocal
  ```


