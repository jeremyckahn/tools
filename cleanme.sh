echo "Are you really really sure?  The current directory is: "
pwd
read -e INPUT

# Jeremy needs to get better at BASH scripting...
if [[ $INPUT == "y" || $INPUT == "Y" || $INPUT  == "yes" ]]; then
	echo "Removing .svn, .DS_, and ._* files... "

	find . -iname ".svn*" | xargs rm -Rv
	find . -iname ".DS_*" | xargs rm -Rv
	find . -iname "._*" | xargs rm -Rv
	
	echo "All done!"
else
	echo "Cleaning of the directory was canceled."
fi
