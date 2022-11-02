function helloWorld {
	# declare STRING variable
	STRING="Hello World"
	# print variable on a screen
	echo $STRING
}

function enableAutomaticUpdates {
	sudo dpkg-reconfigure -plow unattended-upgrades
}

function giveGoodPasswords {
	PASSWORD="Sandwich1!"
	while read USER; do
  	    echo $USER:$PASSWORD | chpasswd
	    done < users.txt
}
