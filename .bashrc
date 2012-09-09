for file in ~/.{bash_cygwin,bash_prompt,bash_aliases,bash_functions}; do
  [ -r "$file" ] && source "$file"
done

unset file

PATH="$HOME/hier/usr/bin/:$HOME/hier/bin:$HOME/hier/usr/local/bin/:$PATH"
LD_LIBRARY_PATH="$HOME/hier/usr/lib64/:$HOME/hier/usr/lib:$LD_LIBRARY_PATH"
#export FAKECHROOT_CMD_SUBST=/sbin/insserv=/bin/true:/sbin/ldconfig=/bin/true:/usr/bin/ischroot=/bin/true:/usr/bin/ldd=/usr/bin/ldd.fakechroot:/usr/bin/mkfifo=/bin/true
