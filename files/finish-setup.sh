echo Recieved home dir: $1

cp -rf /etc/local/finish-setup/config/* $1/.config

bash <(curl -s https://raw.githubusercontent.com/blue-build/cli/main/install.sh)