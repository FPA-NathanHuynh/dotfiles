zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }
