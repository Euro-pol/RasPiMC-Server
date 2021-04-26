#!/bin/bash

echo "Welcome! This script installs a minecraft server for you"
echo "Installing Java 11"
sudo apt update
sudo apt install default-jdk
echo "Done"
echo "Instaling screen"
sudo apt install screen
echo "Done"
echo "Getting buildtools"
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
echo "Building latest spigot jar, if you want another version, you can do java -jar BuildTools.jar --rev (version)"
echo "If you want to install another server software, you need to name it server.jar"
sleep 3
echo "You need to wait some minutes if you have a Pi 2/3"
java -jar BuildTools.jar --rev latest
echo "Done! Now running to generate the server.properties. Then to start the server you can use the start.sh"
sudo rm -r apache-maven-3.6.0
sudo chmod u+x start.sh
sudo rm -r BuildData
sudo rm -r Spigot
sudo rm -r CraftBukkit
sudo rm -r Bukkit
sudo rm -r work
sudo cp spigot*.jar server.jar
echo "Goodbye!"
echo "If you have any problems/questions, contact me on discord: timof121#1141"
java -jar server.jar
