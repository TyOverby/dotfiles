for file in ~/.{bash_cygwin,bash_prompt,bash_aliases,bash_functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

export EPREFIX="$HOME/root"
export PATH="$EPREFIX/usr/sbin/:$EPREFIX/usr/bin:$EPREFIX/bin:$EPREFIX/tmp/usr/bin:$EPREFIX/tmp/bin:/usr/bin:/bin"
export FAKECHROOT_CMD_SUBST=/sbin/insserv=/bin/true:/sbin/ldconfig=/bin/true:/usr/bin/ischroot=/bin/true:/usr/bin/ldd=/usr/bin/ldd.fakechroot:/usr/bin/mkfifo=/bin/true
