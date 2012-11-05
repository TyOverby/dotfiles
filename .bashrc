for file in ~/.{bash_cygwin,bash_prompt,bash_aliases,bash_functions}; do
  [ -r "$file" ] && source "$file"
done

source ~/.z.sh

unset file

#export EPREFIX="$HOME/root"
#export PATH="$EPREFIX/usr/sbin/:$EPREFIX/usr/bin:$EPREFIX/bin:$EPREFIX/tmp/usr/bin:$EPREFIX/tmp/bin:/usr/bin:/bin"
#export FAKECHROOT_CMD_SUBST=/sbin/insserv=/bin/true:/sbin/ldconfig=/bin/true:/usr/bin/ischroot=/bin/true:/usr/bin/ldd=/usr/bin/ldd.fakechroot:/usr/bin/mkfifo=/bin/true

#PATH="$HOME/hier/usr/bin/:$HOME/hier/bin:$HOME/hier/usr/local/bin/:$PATH"
##PATH="/homes/iws/tyoverby/root/sbin:/homes/iws/tyoverby/root/bin:$PATH"
##MANPATH="/homes/iws/tyoverby/root/man:$PATH"
#LD_LIBRARY_PATH="$HOME/hier/usr/lib64/:$HOME/hier/usr/lib:$LD_LIBRARY_PATH"
#export FAKECHROOT_CMD_SUBST=/sbin/insserv=/bin/true:/sbin/ldconfig=/bin/true:/usr/bin/ischroot=/bin/true:/usr/bin/ldd=/usr/bin/ldd.fakechroot:/usr/bin/mkfifo=/bin/true
