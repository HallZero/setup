
# Installing Node JS
# If there is a previous version of Node.js installed, remove it

if [ -x "$(command -v node)" ]; then
  sudo apt-get purge nodejs -y
  sudo rm -r /etc/apt/sources.list.d/nodesource.list
  sudo rm -r /etc/apt/keyrings/nodesource.gpg
fi

# Install Node.js 21.x
curl -fsSL https://deb.nodesource.com/setup_21.x | bash - &&\
apt-get install -y nodejs
