LIGHTDM_PATH="/etc/lightdm/lightdm.conf"
COMMONAUTH_PATH="/etc/pam.d/common-auth"
COMMONPASSWORD_PATH="/etc/pam.d/common-password"
LOGINDEFS_PATH="/etc/login.defs"

function enableReadWrite {
	chmod 777 $LIGHTDM_PATH
	chmod 777 $COMMONAUTH_PATH
	chmod 777 $COMMONPASSWORD_PATH
	chmod 777 $LOGINDEFS_PATH
}

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

function disableGuestAccount {
	echo -e "\nallow-guest=false" >> $LIGHTDM_PATH
}

function disableRemoteLogin {
	echo -e "\ngreeter-show-remove-login=false" >> $LIGHTDM_PATH
}

function setAccountPolicies {
	echo -e "\nauth required pam_tally2.so deny=5 onerr=fail unlock_time=1800" >> $COMMONAUTH_PATH
}

function installFirewall {
	sudo apt-get install ufw -y -qq
	sudo ufw allow ssh
	sudo ufw allow http
	sudo ufw enable
}

function disableRoot {
	sudo passwd -l root
}
