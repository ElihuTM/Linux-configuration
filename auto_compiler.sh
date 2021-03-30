#!/bin/bash

file='not file'
input=$@

getFileType() {
	echo $file | cut -d '.' -f 2
}

getFileName() {
	echo $file | cut -d '.' -f 1
}
 
getValidFiles() {
	ls -t | awk '$1 ~/.\.cpp/ || $1 ~/.\.py/ || $1 ~/.\.java/ || $1 ~/.\.rb/ || $1 ~/.\.js/'
}

getSpecificFile() {
	echo $input | awk '{for(i=1; i<=NF; ++i) if($i == "--file" || $i == "-f") print $(i+1)}'
}

getFile() {
	specific_file=$(getSpecificFile)
	if [[ -f $specific_file ]]; then
		file=$specific_file
	else
		file=$(echo $(getValidFiles) | cut -d ' ' -f 1)
	fi
}

compilar() {
	file_type=$(getFileType)	
	case $file_type in
		cpp)
			g++ -std=c++11 -o ej $file
			;;
		java)
			javac $file
			;;
		*)
			return 0
			;;
	esac
}

ejecutar() {
	file_type=$(getFileType)
	case $file_type in
		cpp)
			./ej
			;;
		java)
			java $(getFileName)
			;;
		py)
			python3 $file
			;;
		rb)
			ruby $file
			;;
		js)
			node $file
			;;
		*)
			return 3312
			;;
	esac
}

getFile && compilar && echo "ejecutando $file..." && ejecutar

