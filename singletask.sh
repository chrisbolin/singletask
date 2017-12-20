FILE="singletask.txt"
FILE_PATH=$TMPDIR$FILE

print_help () {
	echo 'Usage:'
	echo
	echo '     singletask          see current task'
	echo '     singletask [task]   set new task'
	echo '     singletask -        clear task'
	echo '     singletask -h       help'
	echo
}

if [ -z "$1" ]; then
	# read task #
	TASK=$(cat $FILE_PATH)
	if [ "$TASK" = "" ]; then
		echo "no task set"
		echo
		print_help
	else
		echo "➡  $TASK"
	fi
else if [ "$1" = "-" ]; then
   # erase task #
	 echo "" > $FILE_PATH
	 echo "cleared task ✓"
 else if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    # help menu #
 	 echo 'singletask is a simple task reminder'
 	 echo
	 print_help
else
  # set task #
	echo $1 > $FILE_PATH
	echo "✓  $1"
fi fi fi
