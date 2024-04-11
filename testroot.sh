#/bin/sh
echo UID = "$UID", EUID = "$EUID"
if [[ ("$UID" = "") || ("$UID" = "0") ]] ; then
	 echo Running as root; 
else
	echo Not running as root;
fi
