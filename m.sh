#!/bin/sh
wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/56.0.1/linux-i686/pt-BR/firefox-56.0.1.tar.bz2

tar -xjvf firefox-56.0.1.tar.bz2

rm -r /opt/firefox*

mv firefox /opt/firefox56

ln -s /opt/firefox31/firefox /usr/bin/firefox