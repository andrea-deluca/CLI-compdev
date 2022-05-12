#!/bin/bash
program=compdev
current_dir=.
config_path=path/to/config/folder/in/wsl
command=$1
project=$2
module=$2
option=$3
# no command passed to the program
if [ $# -lt 1 ]
then
	echo "usage: $program <command> ..."
	echo "For info about <command> you can type: $program help"
fi
# a command is passed
if [ $# -eq 1 ]
then
	case $command in
		init )
			# init requires also a name for the project and, possibly, options.
			echo -e "usage: $program $command <project_name> [--template]" ;;
		add )
			# add requires also the name of the module that has be added
			echo -e "usage: $program $command <module_name>" ;;
		help )
			# exec help command
			clear
			echo -e "\n\nThe format to run $program commmands is:"
			echo -e "\t$program <command> [...]\n"
			echo -e "\nHere the list of commands you can use instead of <command>:\n"
			echo -e "\t-init: $program init <project_name> [--template]"
			echo -e "\tIt initialize your project called project_name by means creating source/, build/ and modules/ folders and Makefile/, source/scanner.jflex and source/parser.cup empty files."
			echo -e "\tUsing --template option it also add java_cup and jflex modules and templated usuful files.\n"
			echo -e "\t-add: $program add <module_name>"
			echo -e "\tIf you have already initialized your project, it can add defined modules in your project, within the modules/ folder."
			echo -e "\tModules you can use instead of module_name are java_cup and jflex.\n"
			echo -e "\t-help: $program help"
			echo -e "\tShow info about defined commands\n\n"
			;;
		* )
			# command not defined
			echo "$program $command is not defined."
			echo "For info about <command> you can use type: $program help" ;;
	esac
elif [ $# -eq 2 ]
then
	case $command in
		init )
			if [ -d $project ] && [ $project != $current_dir ]
			then
				# a directory with the same passed project name already exists
				echo "ERROR: a directory called $project already exists."
				echo "Please use a project name not equal to a folder in the current path."
			else
				if [ $project != $current_dir ]
				then
					# create a folder called with the passed project name
					mkdir $project
				fi
				# init the project structure and add usuful files
				mkdir $project/build $project/source $project/modules
				touch $project/source/scanner.jflex $project/source/parser.cup $project/Makefile
				echo -e "\nDone. Your porject is now ready in $project/ folder!"
				echo "You can start to develop your compiler."
				echo -e "\nHave you a good day!"
			fi ;;
		add )
			if [ -d ./modules ]
			then
				case $module in
					java_cup )
						# add java_cup module into modules folder of the project
						cp -r $config_path/modules/java_cup ./modules/java_cup
						echo -e "\nDone. Module $module has been added in modules/ folder!\n" ;;
					jflex )
						# add jflex module into modules folder of the project
						cp -r $config_path/modules/jflex ./modules/jflex
						echo -e "\nDone. Module $module has been added in modules/ folder!\n" ;;
					* )
						# module passed is not found or it is not defined
						echo "Module not found. Please use a defined <module_name>."
						echo "For info about <command> you can type: $program help" ;;
				esac
			else
				# a module can not be added because the project has not been initialized yet
				echo "ERROR: module can't be added because your project has not been initialized yet."
				echo "Please, first init your project with $program init <project_name> [--template]."
			fi ;;
		help )
			# others args are not allowed in help command
			echo "usage: $program $command" ;;
		* )
			# command not defined
			echo "$program $command is not defined."
			echo "For info about <command> you can use type: $program help" ;;
	esac
elif [ $# -eq 3 ]
then
	case $command in
		init )
			case $option in
				--template )
					if [ -d $project ] && [ $project != $current_dir ]
					then
						# a directory with the same passed project name already exists
						echo "ERROR: a directory called $project already exists."
						echo "Please use a project name not equal to a folder in the current path."
					else
						if [ $project != $current_dir ]
						then
							# create a folder called with the passed project name
							mkdir $project
						fi
						# init the project structure and add modules and templated files.
						mkdir $project/build $project/source $project/modules
						cp -r $config_path/scanner.jflex $project/source/scanner.jflex
						cp -r $config_path/parser.cup $project/source/parser.cup
						cp -r $config_path/modules/java_cup $project/modules/java_cup
						cp -r $config_path/modules/jflex $project/modules/jflex
						cp $config_path/win_makefile/Makefile $project/Makefile
						echo -e "\nDone. Your porject is now ready in $project/ folder!"
						echo "and start to develop your compiler."
						echo -e "\nHave you a good day!"
					fi ;;
				* )
					# option passed is not defined
					echo "ERROR: option $option is not defined."
					echo "Maybe did you mean --template option?" ;;
			esac ;;
		add )
			# just module name is allowed in add command
			echo "usage: $program $command <module_name>" ;;
		help )
			# others args are not allowed in help command
			echo "usage: $program $command" ;;
		* )
			# command not defined
			echo "$program $command is not defined."
			echo "For info about <command> you can use type: $program help" ;;
	esac
elif [ $# -gt 3 ]
then
	case $command in
		init )
			# just project name and, possibly, options are allowed in init command
			echo "usage: $program $command <porject_name> [--template]" ;;
		add )
			# just module name is allowed in add command
			echo "usage: $program $command <module_name>" ;;
		help )
			# others args are not allowed in help command
			echo "usage: $program $command" ;;
		* )
			# command not defined
			echo "$program $command is not defined."
			echo "For info about <command> you can use type: $program help" ;;
	esac
fi
