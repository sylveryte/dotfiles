#! /bin/sh
#
# motiv.sh
# Copyright (C) 2020 sylveryte <sylveryte@pm.me>
#
# Distributed under terms of the MIT license.
#

DIR=~/Pictures/galaxy/
SDIR=~/Pictures/sgalaxy/
MOTIV=/tmp/sylmotiv
SMOTIV=/tmp/sylsmotiv


function getmotiv() {
	echo $(find $MOTIV -type f 2>/dev/null)
}
function getsmotiv() {
	echo $(find $SMOTIV -type f 2>/dev/null)
}

function destroy() {
	rm -r $MOTIV
	rm -r $SMOTIV
}

# if not already initialized
if [[ ! -e $(getmotiv) ]]; then
	# mkdir if doesn't exist
	mkdir -p -- "$MOTIV"
	mkdir -p -- "$SMOTIV"
	SYLNAME=$(ls $DIR | sort -R | head -1)
	MOTIVIMAGE="$DIR/$SYLNAME" 
	SMOTIVIMAGE="$SDIR/$SYLNAME" 

	cp $MOTIVIMAGE $MOTIV
	if [[ -e $SMOTIVIMAGE ]]; then
		cp $SMOTIVIMAGE $SMOTIV
	else
		cp $MOTIVIMAGE $SMOTIV
	fi
fi

RESULT=$(getmotiv)
__ScriptVersion="v0.1"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
function usage ()
{
	echo "Usage :  $0 [options] [--]

	Options:
	  |get motiv 
	-s|get square 
	-d|delete current
	-h|help       Display this message
	-v|version    Display script version"

}    # ----------  end of function usage  ----------

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hvsd" opt
do
case $opt in
	s|square)  RESULT=$(getsmotiv);;
	d|delete)  destroy; exit 0   ;;
	h|help)  usage; exit 0   ;;
	v|version)  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;
	* )  echo -e "\n  Option does not exist : $OPTARG\n"
		 echo $opt
		 exit 1   ;;

esac    # --- end of case ---
done
shift $((OPTIND-1))

echo $RESULT
