# suid

- list files that have SUID or SGID bits set
  ```bash
  find / -type f -perm -04000 -ls 2>/dev/null
  ```

- find the exploitable when the SUID bit: https://gtfobins.github.io/#+suid