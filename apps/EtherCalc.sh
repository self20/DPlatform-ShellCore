#!/bin/sh

[ $1 = update ] && { npm udpate EtherCalc; whiptail --msgbox "EtherCalc updated!" 8 32; exit; }
[ $1 = remove ] && { sh sysutils/service.sh remove EtherCalc; npm uninstall ethercalc; userdel ethercalc; whiptail --msgbox "EtherCalc removed!" 8 32; exit; }

. sysutils/Node.js.sh

# Add ethercalc user
useradd -m ethercalc

# Globa installation
npm i -g ethercalc

# Add SystemD process and run the server
sh sysutils/service.sh EtherCalc "/usr/bin/node /usr/bin/ethercalc" / ethercalc

whiptail --msgbox "EtherCalc installed!

Open http://$URL:8000 in your browser." 10 64
