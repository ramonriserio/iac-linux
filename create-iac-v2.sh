#!/bin/bash

# Declare associative array
declare -A group_directory

# Attribute key-value pair
group_directory["GRP_ADM"]="adm"
group_directory["GRP_VEN"]="ven"
group_directory["GRP_SEC"]="sec"


echo "Creating groups, diretories and user..."

# Iterate associative array
for group in ${!group_directory[@]}
do
    groupadd $group
    mkdir "/${group_directory[${group}]}"
done

# Define users per group
ADM_USERS=("carlos" "maria" "joao")
VEN_USERS=("debora" "sebastiana" "roberto")
SEC_USERS=("josefina" "amanda" "rogerio")

# Create users
for user in "${ADM_USERS[@]}"
do
    useradd "${user}" -p $(openssl passwd Senha123) -G GRP_ADM
    passwd "${user}" -e
done

for user in "${VEN_USERS[@]}"
do
    useradd "${user}" -p $(openssl passwd Senha123) -G GRP_VEN
    passwd "${user}" -e
done

for user in "${SEC_USERS[@]}"
do
    useradd "${user}" -p $(openssl passwd Senha123) -G GRP_SEC
    passwd "${user}" -e
done
