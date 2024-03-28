printf "Checking latest Go version...\n";
LATEST_GO_VERSION="$(curl --silent https://go.dev/VERSION?m=text | head -n 1)";
LATEST_GO_DOWNLOAD_URL="https://go.dev/dl/${LATEST_GO_VERSION}.linux-amd64.tar.gz"

printf "Downloading Go version %s...\n" "$LATEST_GO_VERSION";

# Check if Go is installed
if [ -d "/usr/local/go" ]; then
    printf "A Go version is already installed. Removing it...\n"
    rm -rfv /usr/local/go
else
    printf "No existing Go installation found.\n"
fi

printf "Downloading ${LATEST_GO_DOWNLOAD_URL}\n\n";
curl -OJL --progress-bar $LATEST_GO_DOWNLOAD_URL

printf "Extracting file...\n"
tar -C /usr/local -xzf ${LATEST_GO_VERSION}.linux-amd64.tar.gz
rm ${LATEST_GO_VERSION}.linux-amd64.tar.gz

printf "Configuring GOPATH.\n"
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

printf "You are ready to Go!\n\n";
go version

# Set GOROOT
export GOROOT=/usr/local/go

# Set GOPATH
export GOPATH="$HOME/go"

# Update PATH
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"