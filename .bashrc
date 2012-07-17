for file in ~/.{bash_cygwin,bash_prompt,bash_aliases,bash_functions}; do
  [ -r "$file" ] && source "$file"
done

unset file
