# Functions

function extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1		;;
			*.tar.gz)	tar xzf $1		;;
			*.bz2)		bunzip2 $1		;;
			*.rar)		rar x $1		;;
			*.gz)		gunzip $1		;;
			*.tar)		tar xf $1		;;
			*.tbz2)		tar xjf $1		;;
			*.tgz)		tar xzf $1		;;
			*.zip)		unzip $1		;;
			*.Z)		uncompress $1	;;
			*)			echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

function boiler(){
  case $1 in
    *bash)   echo "#!/bin/bash" > $2         ;;
    *python) echo "#!/usr/bin/python" >$2    ;;
    *java)   echo "class $2{\n\n}" > "$2.java" ;;
    *)       echo "'$1' is not accepted"       ;;
  esac
}

function f(){
  find . -name "$1"
}

