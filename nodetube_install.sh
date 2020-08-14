echo -e "\n---- Installing Server ----"

sudo apt-get install curl

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

sudo apt-get -y install \
    npm nodejs git build-essential nginx youtube-dl python-setuptools python-dev build-essential tcptrack vnstat nethogs redis-server build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip ffmpeg

sudo apt-get update
sudo apt-get upgrade

git clone git@github.com:mayeaux/nodetube.git
cd nodetube
npm install

# installing and starting mongodb
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt update
sudo apt install mongodb-org
sudo systemctl start mongod.service
sudo systemctl enable mongod.service

echo "NodeTube installed, starting it's service..."
npm start
