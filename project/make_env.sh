#!/bin/bash

cp secrets/credentials.txt srcs/.env

DB_PASSWORD_FILE=$(cat "secrets/db_root_password.txt")
echo "DB_ROOT=$DB_PASSWORD_FILE" >> srcs/.env

DB_PASSWORD_FILE=$(cat "secrets/wp_password.txt")
echo "WP_USERPASS=$DB_PASSWORD_FILE" >> srcs/.env 

DB_PASSWORD_FILE=$(cat "secrets/db_password.txt")
echo "DB_PASS=$DB_PASSWORD_FILE" >> srcs/.env

DB_PASSWORD_FILE=$(cat "secrets/adm_wp_password.txt")
echo "ADM_WP_PASS=$DB_PASSWORD_FILE" >> srcs/.env
