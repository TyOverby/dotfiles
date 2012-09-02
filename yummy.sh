# /usr/bin/env bash

program_name="$1"
temp_dir="$HOME/.yummy"
dest_dir="$HOME/hier"

`mkdir $temp_dir > /dev/null`
cd $temp_dir

# ============================================
# = Determine the processor information used =
# = Later when extracting the file.          =
# = If this fails, quit the script           =
# ============================================
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



# =================================================
# = Try to download the file using yumdownloader. =
# = If this fails, quit the script                =
# =================================================
echo "Attempting to find '$program_name'..."

rpmfiles=`yumdownloader $program_name`

if [ $? -eq 0 ]
then
    echo "    download sucessful"
else
    echo "    $program_name could not be found."
    exit 1
fi



# =================================================
# = Look for a file that matches your cpu and     =
# = your architecture.                            =
# = If this fails, quit the script                =
# =================================================
echo "Checking downloaded files for matches..."
file_to_extract=`ls $dirname | grep $program_name | grep $proc`
if [ $? -eq 0 ]
then
    echo "    Matching file found!"
    echo "    $file_to_extract"
else
    echo "No file found matching '$program_name' and '$proc'"
    exit 1
fi



# =================================================
# = Converts the downloaded rpm to a cpio file    =
# = which is then extracted                       =
# =================================================
echo "Converting and extracting files"
cp $file_to_extract $dest_dir
(cd $dest_dir && rpm2cpio $file_to_extract | cpio -id && rm $file_to_extract)


# =================================================
# = Cleans up the downloaded .rpm files           =
# =================================================
rm *.rpm





