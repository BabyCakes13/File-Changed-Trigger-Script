#!/bin/bash
inotifywait -m $1 -e close_write | 
	while read -r directory events file 
	do		
		if [ "$file" = "$2" ] && [ ${file: -3} == ".md"  ]
		then 
			cat $1/$file
			html_file=${file%.md}.html
			grip $file --export $html_file
			xdg-open $html_file
		fi
	done
