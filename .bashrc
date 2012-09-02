for file in ~/.{bash_cygwin,bash_prompt,bash_aliases,bash_functions}; do
  [ -r "$file" ] && source "$file"
done

unset file

PATH="$PATH:~/hier/usr/bin/:~/hier/bin:~/hier/usr/local/bin/"
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:~/hier/usr/lib64/:~/hier/usr/lib"
