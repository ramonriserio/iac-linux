#!/bin/bash

# O próximo comando garante que os pipelines falhem se qualquer comando dentro
# deles falhar e trata váriaveis não definidas como erros
set -euxo pipefail

echo "Atualizando o servidor..."
apt-get update
apt-get upgrade -y
apt-get install apache2 -y
apt-get install unzip -y

echo "Baixando e copiando os arquivos da aplicação..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cp -R /tmp/linux-site-dio-main/* /var/www/html/

echo "Apagando arquivos e diretórios temporários..."
rm /tmp/main.zip
rm -rf /tmp/linux-site-dio-main/
