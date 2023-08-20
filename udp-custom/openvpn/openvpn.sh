#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition 1.0
# Auther  : givpn
# (C) Copyright 2023
# =========================================
# pewarna hidup
BGreen='\e[1;32m'
NC='\e[0m'
domain=$(cat /etc/xray/domain)
echo "$domain" > /root/domain
clear
MYIP=$(wget -qO- ifconfig.co);
MYIP2="s/xxxxxxxxx/$MYIP/g";
# // install squid for ubuntu 18/20
apt -y install squid3

# install squid for debian 11
sleep 1
echo "\e[1;32m Proses Download squid.. \e[0m"
apt -y install squid
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/givpn/AutoScriptXray/master/udp-custom/openvpn/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# // OpenVPN
sleep 1
echo "\e[1;32m Proses Download OpenVPN.. \e[0m"
wget https://raw.githubusercontent.com/givpn/AutoScriptXray/master/udp-custom/openvpn/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

cd
chown -R www-data:www-data /home/vps/public_html
sleep 0.5
echo -e "$BGreen[SERVICE]$NC Restart All service SSH & OVPN"
/etc/init.d/nginx restart >/dev/null 2>&1
sleep 0.5
echo -e "[ ${BGreen}ok${NC} ] Restarting nginx"
/etc/init.d/openvpn restart >/dev/null 2>&1
sleep 0.5
echo -e "[ ${BGreen}ok${NC} ] Restarting cron "
/etc/init.d/ssh restart >/dev/null 2>&1
sleep 0.5
echo -e "[ ${BGreen}ok${NC} ] Restarting ssh "
/etc/init.d/dropbear restart >/dev/null 2>&1
sleep 0.5
echo -e "[ ${BGreen}ok${NC} ] Restarting dropbear "
/etc/init.d/fail2ban restart >/dev/null 2>&1
sleep 0.5
echo -e "[ ${BGreen}ok${NC} ] Restarting fail2ban "
/etc/init.d/stunnel4 restart >/dev/null 2>&1
sleep 0.5
echo -e "[ ${BGreen}ok${NC} ] Restarting stunnel4 "
/etc/init.d/vnstat restart >/dev/null 2>&1
sleep 0.5
echo -e "[ ${BGreen}ok${NC} ] Restarting vnstat "
/etc/init.d/squid restart >/dev/null 2>&1
clear
echo " "
echo "Installation has been completed!!"echo " "
echo "===============================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - SlowDNS SSH             : ALL Port SSH"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22, 2253"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194"  | tee -a log-install.txt
echo "   - OpenVPN                 : SSL  990"  | tee -a log-install.txt
echo "   - OpenVPN                 : UDP  2200"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 445"  | tee -a log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a log-install.txt
echo "   - CloudFront Websocket    : "  | tee -a log-install.txt
echo "   - SSH Websocket TLS       : 443"  | tee -a log-install.txt
echo "   - SSH Websocket HTTP      : 8880"  | tee -a log-install.txt
echo "   - Websocket OpenVPN       : 2086"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2083"  | tee -a log-install.txt
echo "   - XRAYS VMESS GRPC        : 1180"  | tee -a log-install.txt
echo "   - XRAYS VLESS GRPC        : 2280"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a log-install.txt
echo "   - TrojanGo                : 2087"  | tee -a log-install.txt
echo "   - OpenSSH                  : 22"  | tee -a log-install.txt
echo "   - SSH Websocket            : 80" | tee -a log-install.txt
echo "   - SSH SSL Websocket        : 443" | tee -a log-install.txt
echo "   - Stunnel4                 : 222, 777" | tee -a log-install.txt
echo "   - Dropbear                 : 109, 143" | tee -a log-install.txt
echo "   - Badvpn                   : 7100-7900" | tee -a log-install.txt
echo "   - Nginx                    : 81" | tee -a log-install.txt
echo "   - Vmess WS TLS             : 443" | tee -a log-install.txt
echo "   - Vless WS TLS             : 443" | tee -a log-install.txt
echo "   - Trojan WS TLS            : 443" | tee -a log-install.txt
echo "   - Shadowsocks WS TLS       : 443" | tee -a log-install.txt
echo "   - Vmess WS none TLS        : 80" | tee -a log-install.txt
echo "   - Vless WS none TLS        : 80" | tee -a log-install.txt
echo "   - Trojan WS none TLS       : 80" | tee -a log-install.txt
echo "   - Shadowsocks WS none TLS  : 80" | tee -a log-install.txt
echo "   - Vmess gRPC               : 443" | tee -a log-install.txt
echo "   - Vless gRPC               : 443" | tee -a log-install.txt
echo "   - Trojan gRPC              : 443" | tee -a log-install.txt
echo "   - Shadowsocks gRPC         : 443" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
clear
rm -rf openvpn.sh
sleep 5
cd
clear

