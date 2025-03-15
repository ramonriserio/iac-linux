#!/bin/bash

echo "Creating user groups..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC


echo "Creating users..."

useradd carlos -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -crypt Senha123) -e
useradd maria -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -crypt Senha123) -e
useradd joao -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -crypt Senha123) -e

useradd debora -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -crypt Senha123) -e
useradd sebastiana -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -crypt Senha123) -e
useradd roberto -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -crypt Senha123) -e

useradd josefina -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -crypt Senha123) -e
useradd amanda -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -crypt Senha123) -e
useradd rogrio -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -crypt Senha123) -e


echo "Creating directories ..."

mkdir /adm
mkdir /ven
mkdir /sec
mkdir /publico


echo "Specifying diretories permissions..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /adm
chown root:GRP_SEC /adm

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico


echo "The end..."