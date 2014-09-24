
helpmsg()
{
	echo "Help content here"
	exit $1
}

getVersion()
{
	if [ -a .version ]; then
		version=$(cat .version)
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

echo "more code"

#rm .version
#touch .version