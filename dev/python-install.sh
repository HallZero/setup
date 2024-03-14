# Verifies if python is already installed
if [ -d "/usr/local/python" ]; then
    printf "Python is already installed. Removing it...\n"
    rm -rfv /usr/local/python
else
    printf "No existing Python installation found.\n"
fi

# Download the latest Python version
printf "Downloading the latest Python version...\n"
LATEST_PYTHON_VERSION="$(curl --silent https://www.python.org/downloads/ | grep -oP 'Python\s\d+\.\d+\.\d+' | head -n 1 | grep -oP '\d+\.\d+\.\d+')"

printf "Downloading Python version %s...\n" "$LATEST_PYTHON_VERSION";

curl -OJL --progress-bar https://www.python.org/ftp/python/${LATEST_PYTHON_VERSION}/Python-${LATEST_PYTHON_VERSION}.tgz

printf "Extracting file...\n"

tar -C /usr/local -xzf Python-${LATEST_PYTHON_VERSION}.tgz

rm Python-${LATEST_PYTHON_VERSION}.tgz

printf "Configuring PATH.\n"

export PATH=$PATH:/usr/local/python/Python-${LATEST_PYTHON_VERSION}/bin

alias python=python3

# Installing pip
printf "Installing pip...\n"

curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | sudo python

