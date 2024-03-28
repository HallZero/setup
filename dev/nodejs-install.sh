
# Installing Node JS
# If there is a previous version of Node.js installed, remove it

if [ -x "$(command -v node)" ]; then
  sudo apt-get purge nodejs -y
  sudo rm -r /etc/apt/sources.list.d/nodesource.list
  sudo rm -r /etc/apt/keyrings/nodesource.gpg
fi

# Install Node.js latest
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

source ~/.bashrc

nvm install node
