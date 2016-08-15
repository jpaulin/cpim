#!/bin/bash

# Of notation in cpim.sh code
#  - smallcaps vars are local
#  - some parts of the code from gists in Github, credit due here in source

# Fix:
#  - handle possible ambiguity, when makeHome() encounters a folder, but
#    no data file

# Variables
# ---------
# These are initially set, but may be overridden by parts of the program
#   Example: 'datafile' if overridden, if -d switch supplied to program  
#
# A variable defining the DSF (storage file) path
datafile="/home/dre/.cpim/cpim.txt"

# 0 = probeDSF did not find a readable DSF file
# 1 = probeDSF found a file
dataFilePresent=0

# Advertisement for the project home page on Github
homewww="https://github.com/jpaulin/cpim/"

# Expect to have all 'cpim' configuration under here
homedir="$HOME/.cpim"

# ----------------------------------------------------------------------

# Prints just the 3 essential signature lines of the software
function printSignature() {
    echo "cpim - a command-line PIM"
    echo " v0.11 (2016)"
    echo " Latest news: $homewww"
}

# Main task list manipulation functions
#
#   insert <N> <desc>
#   delete <id>
#   deleteAll <group>
#   mark <id> <newAttribs>
#   markAll <group> <newAttribs>
#   addToAll <N> <group>
#   subFromAll <N> <group>
# 

# Renumber priorities: insert new task with prio N
#   Assumes a previous list of tasks with any distribution
#   of priority numbers.
# ->
#   If number N does not occur in list, inserts 


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
# a call to this. Exit value is 0 (clean).
function printCurrentConfigs {
    printSignature
    echo
    echo "Configuration dump:"
    echo "        datafile = $datafile"
    echo " dataFilePresent = $dataFilePresent"
    echo "         homedir = $homedir" 
    exit 0
}

# Check that we can read the data file storage
function probeDSF() {
    # Checks for existence of the data file
    if [ ! -f $datafile ]; then
        echo "Error!"
	echo "Was looking for a data file at $datafile"
        echo "Initialize a data file with "
	echo "  cpim --init"
	exit 1
    fi
    # Set flag to show DSF exists
    dataFilePresent=1
}


# Settle: make home - the folder for data file.
# Result: upon success, a ~/.cpim folder exists 
#         or user informed of trouble
function makeHome() {
    if [ ! -d $homedir ]; then
        mkdir -p $homedir
        # Now we assume a home directory exists. If not, it is fatal.
	if [ ! -d $homedir ]; then
	    echo "Cannot make home directory for cpim"
	    echo "Attempted to mkdir:"
	    echo $homedir
	    exit 1
	fi
        echo "Created home directory $homedir"
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
# Goes through the command line parms, destructively (ie. one pass)
# depends on 'awk' being present as external tool
while [ "$1" != "" ]; do
   PARAM=`echo $1 | awk -F= '{print $1}'`
   VALUE=`echo $1 | awk -F= '{print $2}'`
   case $PARAM in
	    -h | --help)
		    printHelp
		    exit
		    ;;
             -c)
                    probeDSF
		    printCurrentConfigs
		    exit
		    ;;
	     -i | --init)
		    makeHome
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
if [ "$dataFilePresent" -eq 1 ]; then
    showDSF
fi
if [ "$dataFilePresent" -eq 0 ]; then
    echo "No data file"
fi
# Show a calendar view, with week numbers at bottom 
ncal -w
exit 0
