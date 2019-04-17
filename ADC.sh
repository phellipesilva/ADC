#!/bin/bash
# Automatic Dns Configure
if [ "$USER" != "root" ]; then
  printf "Você não tem permissão root!\n";
else
  d=$(ls /root | grep "ADC")
  if [ "$d" == "ADC" ]; then
    printf "[]=========================================================[]\n";
    printf "[]===           Automatic Dns Configure (ADC)           ===[]\n";
    printf "[]===           Desenvolvido por felipe silva           ===[]\n";
    printf "[]=========================================================[]\n";
    printf "[] (0)=> Sair || (1)=> Padrão || (2) Quad9                 []\n";
    printf "[] (3)=> OpenDNS || (4)=> CleanBrowsing || (5)=> Cloudflare[]\n";
    printf "[] (6)=> Verising || (7)=> Alternate DNS || (00)=> Digitar []\n";
    printf "[]=========================================================[]\n";
    printf "[] Seu arquivo resolv.conf original será salvo em /root/ADC[]\n";
    printf "[]=========================================================[]\n";
    bkp=$(cat /etc/resolv.conf)
    if [ "$bkp" == "" ]; then
      echo $bkp > /root/ADC/resolv.conf.bkp
    else
      printf "Escolha uma opção: ";
      read opc
      case $opc in
        "0")
        clear
        exit
        ;;
        "1")
        echo "# Padrão (google)" > /etc/resolv.conf
        echo "nameserver 8.8.8.8" >> /etc/resolv.conf
        echo "nameserver 8.8.4.4" >> /etc/resolv.conf
        ;;
        "2")
        echo "#Quad9" > /etc/resolv.conf
        echo "nameserver 9.9.9.9" >> /etc/resolv.conf
        echo "nameserver 149.112.112.112" >> /etc/resolv.conf
        ;;
        "3")
        echo "#OpenDNS" > /etc/resolv.conf
        echo "nameserver 208.67.222.222" >> /etc/resolv.conf
        echo "nameserver 208.67.220.220" >> /etc/resolv.conf
        ;;
        "4")
        echo "#CleanBrowsing" > /etc/resolv.conf
        echo "nameserver 185.228.168.9" >> /etc/resolv.conf
        echo "nameserver 185.228.169.9" >> /etc/resolv.conf
        ;;
        "5")
        echo "#Cloudflare" > /etc/resolv.conf
        echo "nameserver 1.1.1.1" >> /etc/resolv.conf
        echo "nameserver 1.0.0.1" >> /etc/resolv.conf
        ;;
        "6")
        echo "#Verising" > /etc/resolv.conf
        echo "nameserver 64.6.64.6" >> /etc/resolv.conf
        echo "nameserver 64.6.65.6" >> /etc/resolv.conf
        ;;
        "7")
        echo "#Alternate DNS" > /etc/resolv.conf
        echo "nameserver 198.101.242.72" >> /etc/resolv.conf
        echo "nameserver 23.253.163.53" >> /etc/resolv.conf
        ;;
        "00")
        printf "Nome: ";
        read n
        printf "DNS1: ";
        read d1
        printf "DNS2: ";
        read d2
        echo $n > /etc/resolv.conf
        echo $d1 >> /etc/resolv.conf
        echo $d2 >> /etc/resolv.conf
        ;;
        esac;
    fi
  else
    mkdir /root/ADC
    ./ADC.sh
  fi
fi
