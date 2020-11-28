#!/bin/bash

file='not file'
file_type='not type'
p="p"		

getFileType() {
	echo $file | cut -d '.' -f 2
}

getFileName() {
	echo $file | cut -d '.' -f 1
}

isValidFile() {	
	if [ $file ]; then
		if [ "$file_type" = "cpp" ] ||
			 [ "$file_type" = "py" ] ||
			 [ "$file_type" = "java" ] ||
			 [ "$file_type" = "rb" ];
		then
			echo "valid"
		else
			echo "no valid"
		fi
	else
		echo "valid"
	fi
}

getFile() {
	extract_specific_file=$(echo $@ | grep -o ent)
	echo "--$extract_specific_file--"
	
	current_position=1
	file=$(ls -t | sed -n 1p)
	file_type=$(getFileType)
	query=$(isValidFile)	

	while [ "$query" != "valid" ]
	do
		current_position=$((current_position+1))
		file=$(ls -t | sed -n $current_position$p)		
		file_type=$(getFileType)
		query=$(isValidFile)
	done
	
	if [ $file ]; then
		return 0
	else
		return 3312
	fi
}

compilar() {
	case $file_type in
		cpp)
			g++ -std=c++11 -o ej $file && return 0
			;;
		java)
			javac $file && return 0
			;;
		*)
			return 0
			;;
	esac
	return 3312
}

ejecutar() {
	case $file_type in
		cpp)
			./ej && return 0
			;;
		java)
			java $(getFileName) && return 0
			;;
		py)
			python3 $file && return 0
			;;
		rb)
			ruby $file && return 0
			;;
		*)
			return 3312
			;;
	esac
}

echo "--$@--"
getFile && compilar && echo "ejecutando..." && ejecutar
