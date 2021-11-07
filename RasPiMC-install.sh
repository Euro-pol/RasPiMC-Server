#!/bin/bash

echo "Welcome! This script installs a minecraft server for you"
echo "Installing aria2c (a better wget)"
sudo apt update -y
sudo apt install aria2 -y
echo "Installing Java 16"
sudo apt-get install -y wget apt-transport-https gnupg
wget https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public
gpg --no-default-keyring --keyring ./adoptopenjdk-keyring.gpg --import public
gpg --no-default-keyring --keyring ./adoptopenjdk-keyring.gpg --export --output adoptopenjdk-archive-keyring.gpg
rm adoptopenjdk-keyring.gpg
sudo mv adoptopenjdk-archive-keyring.gpg /usr/share/keyrings && sudo chown root:root /usr/share/keyrings/adoptopenjdk-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/adoptopenjdk-archive-keyring.gpg] https://adoptopenjdk.jfrog.io/adoptopenjdk/deb <codename> main" | sudo tee /etc/apt/sources.list.d/adoptopenjdk.list
sudo apt update -y
sudo apt install adoptopenjdk-16-jre -y
echo "Done"
sleep 1
echo "Instaling screen"
sudo apt install screen -y
echo "Done"
echo "Getting Purpur"
aria2c https://api.pl3x.net/v2/purpur/1.17.1/latest/download
sleep 1
mv purpur* server.jar
echo "If you want to install another server software, you need to name it server.jar"
sleep 3
echo "Done! Now running to generate the server.properties. Then to start the server you can use the start.sh"
echo "Goodbye!"
java -jar server.jar
