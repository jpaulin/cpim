#!/bin/bash

# Of notation in cpim.sh
#  - smallcaps vars are local
#  - some parts of the code from gists in Github, credit due here in source

# Fix:
#  either use the cmd line parser at main level, or pass the original $* array
#  to the function checkSwitches()

# A variable defining the DSF (storage file)
datafile="./cpim_sample.txt"
homewww="https://github.com/jpaulin/cpim/"

# Prints just the 3 essential signature lines of the software
function printSignature() {
    echo "cpim - a command-line PIM"
    echo " v0.1 (2016)"
    echo " Latest news: $wwwhome"
}

# This is the Help screen, for -h switch
function printHelp() {
    printSignature
    echo
    echo " Usage:"
    echo "    $ cpim [-c] [-h] [-d datafile]"
    echo
    echo "      -c  prints current configuration"
    echo "      -d  use alternative datafile"
    echo "      -h  prints this Help screen"
    echo
    echo " Configuration:"
    echo "    cpim looks for a tasks file in a file currently set to:"
    echo "    $datafile"
    echo " Override the configuration with switch -d if needed"
}    

# This function is called as last function, ie. program terminates after
# call
function printCurrentConfigs {
    printSignature
    echo
    echo "Configuration dump:"
    echo " datafile=$datafile"
    exit 0
}

# Check that we can read the data file storage
function probeDSF() {
    # Checks for existence of the data file
    if [ ! -f $datafile ]; then
        echo "Error!"
	echo "Was looking for a data file at $datafile"
	exit 1
    fi
}


# Shows the contents of data file  
function showDSF() {
    if [ -f $datafile ]; then
        cat $datafile | sort -n
    else
        echo "[No tasks]"
    fi
    echo "----------------------------------------------------------------------"
}

# Main entry point

# Note: Always first check switches, then call 'probeDSF' 

# checkSwitches
while [ "$1" != "" ]; do
   PARAM=`echo $1 | awk -F= '{print $1}'`
   VALUE=`echo $1 | awk -F= '{print $2}'`
   case $PARAM in
	    -h | --help)
		    printHelp
		    exit
		    ;;
        -c)
		    printCurrentConfigs
		    exit
		    ;;
	    -d | --datafile)
		    datafile=$VALUE
            exit
		    ;;
	    *)
		    echo "ERROR: unknown parameter \"$PARAM\""
		    printHelp
		    exit 1
		    ;;
	esac
	shift
done

# Check existence of data file    
probeDSF
showDSF
# Show a calendar view, with week numbers at bottom 
ncal -w
exit 0
