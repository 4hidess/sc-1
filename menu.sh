#!/bin/bash

clear

if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "It looks like you are not running this installer on Debian, Ubuntu or Centos system"
	exit
fi
color3='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipv4.icanhazip.com )
	echo "--------------- Welcome To Premium Script Menu ---------------"
	echo "------------------------ Moddified By Mardhex -----------------------"
	echo " "
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "\e[032;1mCPU Model:\e[0m $cname"
	echo -e "\e[032;1mNumber Of Cores:\e[0m $cores"
	echo -e "\e[032;1mCPU Frequency:\e[0m $freq MHz"
	echo -e "\e[032;1mTotal Amount Of RAM:\e[0m $tram MB"
	echo -e "\e[032;1mTotal Amount Of Swap:\e[0m $swap MB"
	echo -e "\e[032;1mSystem Uptime:\e[0m $up"
	echo -e "\e[032;1mIsp Name:\e[0m $ISP"
	echo -e "\e[032;1mCity:\e[0m $CITY"
	echo -e "\e[032;1mTime:\e[0m $WKT"
	echo -e "\e[033;1mIPVPS:\e[0m $IPVPS"
	date | lolcat
	echo -e "-----------------------------------------------------"

echo -e ""

echo -e "Menu Utama" | lolcat -a -d 10

echo -e " 1.  Control Panel SSH & OVPN"

echo -e " 2.  Control Panel Wireguard"

echo -e " 3.  Control Panel L2TP & PPTP"

echo -e " 4.  Control Panel SSTP"

echo -e " 5.  Control Panel SSR & Shadowsocks"

echo -e " 6.  Control Panel Vmess/V2ray"

echo -e " 7.  Control Panel Vless"

echo -e " 8.  Control Panel Trojan"

echo -e " 9.  Control Panel UDP"

echo -e ""

echo -e "Menu Tambahan" | lolcat -a -d 10

echo -e " 10.   Add Subdomain Host For VPS"

echo -e " 11.  Renew Certificate V2RAY"

echo -e " 12.  Change Port All Account"

echo -e " 13.  Autobackup Data VPS"

echo -e " 14.  Backup Data VPS"

echo -e " 15.  Restore Data VPS"

echo -e " 16.  Webmin Menu"

echo -e " 17.  Limit Bandwith Speed Server"

echo -e " 18.  Check Usage of VPS Ram"

echo -e " 19.  Reboot VPS"

echo -e " 20.  Speedtest VPS"

echo -e " 21.  Information Display System"

echo -e " 22.  Info Script Auto Install"

echo -e " 23.  Restart All Service"

echo -e " 24.  Set Auto Reboot"

echo -e " 25.  Set Multi Login Akun"

echo -e " 26.  Install BBR"

echo -e " 27.  Add ID Cloudfare"

echo -e " 28.  Cloudfare Add-Ons"

echo -e " 29.  Pointing Bug"

echo -e " 30.  Status Tunneling"

echo -e "\e[32m══════════════════════════════════════════\e[m"

echo -e " x.   Exit From Putty / JuiceSSH / Termux"

echo -e "\e[32m══════════════════════════════════════════\e[m"

echo -e ""

read -p "     Please Input Number  [1-22 or x] :  "  num

echo -e ""

case $num in

1)

tessh

;;

2)

wgg

;;

3)

ltp

;;

4)

ssstp

;;

5)

sssr

;;

6)

wss

;;

7)

vls

;;

8)

trj

;;

9)

menu-udp

;;


10)

add-host

;;

11)

certv2ray

;;

12)

change-port

;;

13)

autobackup

;;

14)

backup

;;

15)

restore

;;

16)

wbmn

;;

17)

limit-speed

;;

18)

ram

;;

19)

reboot

;;

20)

speedtest

;;

21)

info

;;

22)

about

;;

23)

restart

;;

24)

auto-reboot

;;

25)

autokill

;;

26)

bbr

;;

27)

cff

;;

28)

cfd

;;

29)

cfh

;;

30)

running

;;

x)

exit

;;

*)

echo "Please enter an correct number"

;;

esac
