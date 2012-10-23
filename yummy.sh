# /usr/bin/env bash

temp_dir="$HOME/.yummy"
dest_dir="$HOME/root/"

`mkdir $temp_dir > /dev/null 2> /dev/null`
cd $temp_dir



get(){
    # Try to download the file using yumdownloader.
    # If this fails, quit the script
    echo "Attempting to find '$1'..."

    rpmfiles=`yumdownloader $1`

    if [ $? -eq 0 ]
    then
        echo "    download sucessful"
    else
        echo "    $1 could not be found."
        exit 1
    fi
}

# Install a program with the program name given as the
# first argument.
install(){
    program_name="$1"


    # Determine the processor information used
    # Later when extracting the file.
    # If this fails, quit the script.
    echo "Determining processor architecture..."
    uname=`uname -a`
    echo $uname | grep x86 > /dev/null
    if [ $? -eq 0 ]
    then
        proc="x86"
    else
        echo $uname | grep i686 > /dev/null
        if [ $? -eq 0 ]
        then
            proc="i686"
        else
            echo "    Unable to determine processor"
            exit 1
        fi
    fi
    echo "    Processor is $proc"



    get $1


    # Look for a file that matches your cpu and
    # your architecture.
    # If this fails, quit the script
    echo "Checking downloaded files for matches..."
    file_to_extract=`ls $dirname | grep $program_name | grep -E "($proc)|(noarch)"`
    if [ $? -eq 0 ]
    then
        echo "    Matching file found!"
        echo "    $file_to_extract"
    else
        echo "No file found matching '$program_name' and '$proc'"
        exit 1
    fi

    # Finding dependencies
    echo "Project Dependencies"
    yum deplist $program_name | grep dependency



    # Converts the downloaded rpm to a cpio file
    # which is then extracted
    echo "Converting and extracting files"
    cp $file_to_extract $dest_dir
    (cd $dest_dir && rpm2cpio $file_to_extract | cpio -idu && rm $file_to_extract)


    # Cleans up the downloaded .rpm files
    rm *.rpm
}

deps(){
    echo "Dependencies$1"
    echo "============"
    repoquery --requires $1
}

help(){
    echo -e "NAME\n\tyummy"
    echo -e "SYNOPSIS\n\tyummy command package"
    echo -e "DESCRIPTION\n"
    echo -e "\tYummy is used to install packages to an alternate location"
    echo -e "\tthan root.  It is intended for non-super-users to install"
    echo -e "\tprograms easily into their home directories"
    echo -e "\n\n"
    echo -e "\tcommand is one of:"
    echo -e "\t * install package"
    echo -e "\t * deps package"
    echo -e "\t * get package"
}

case $1 in
    get)
        get $2
        ;;
    install)
        install $2
        ;;
    deps)
        deps $2
        ;;
    help|--help|-h)
        help
        ;;
    *)
        echo -e "No such command. Now running help...\n\n"
        help
        ;;
esac
