#!/bin/bash
while read each;
	do
		if [[ -f "API Reference/$each" ]]; then
			printf "<div class=\"api\" id=\"$each\">\n"
			showdown makehtml -p "github" -i "API Reference/$each"
			printf "\n</div>\n"
		else
			echo "<h1 id=\"$each\">$each</h1>"
		fi
	done < list.txt > full.html;