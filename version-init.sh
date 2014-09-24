#!/bin/bash

helpmsg()
{
	echo "Usage: version-init [ -v ] [ -h ]"
	
	if [ $1 -eq 1 ]; then
		echo
		echo "Description:"
		echo "	Inisalizes version for the current directory in a"
		echo "	three digit version code (i.e. 0.0.0)"
		echo "	Use 'version' pkg for all other version edits"
		echo "Options:"
		echo "	-e (optional) Outputs the current version of the"
		echo "	   directory"
		echo
		echo "	-h (optional) Outputs this message"
		echo
	else
		echo "Try 'version-init -h' for more information"
	fi
	exit 1
}

getVersion()
{
	if [ -a .version ]; then
		echo -ne "Current directory version: " 
		echo | cat .version
		exit 0
	else
		echo "ERROR: Versioning for current directory is not available"
		exit 1
	fi
}

while getopts ":v :h" opt; do
	case $opt in
	v) 
		#set this flag to output the current version of the directory
		getVersion
		;;
		
	h)
		#set this flag to output the help content for this program
		helpmsg 1
		;;
	\?)
		echo "ERROR: Invalid option: -$OPTARG"
		helpmsg 0
		;;
	esac
done

shift $(($OPTIND-1))

if [ -a .version ];then
	echo "WARNING: Versioning is already set up for current directory"
	
	read -p "Continue? [y/n]: " -n 1 -r
	echo    
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		echo "Exiting..."
		exit 1
	fi
	echo "Reinisalizing versioning for current directory..."
else
	echo "Inisalizing versioning for current directory..."
fi


rm .version
touch .version
echo "0.0.0" >> .version

echo "Version set to: 0.0.0"
echo "Use 'version' pkg to edit the version"

echo "Done."
exit 0