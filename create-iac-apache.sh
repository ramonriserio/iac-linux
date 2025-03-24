#!/bin/bash

echo "Atualizando o servidor..."
apt-get update
apt-get upgrade -y
apt-get install apache2 -y
apt-get install unzip -y

echo "Baixando e copiando os arquivos da aplicação..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
rm main.zip
cp -R /tmp/linux-site-dio/* /var/www/html/
rm -rf /tmp/linux-site-dio/
