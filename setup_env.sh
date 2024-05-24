#!/bin/bash

# Update package index
sudo apt-get update -y

# Install Java (OpenJDK 11)
sudo apt-get install -y openjdk-11-jdk

# Verify Java installation
java -version

# Install Maven
sudo apt-get install -y maven

# Verify Maven installation
mvn -version

# Install Docker
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index again
sudo apt-get update -y

# Install Docker Engine
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify Docker installation
sudo docker --version

# Add the current user to the docker group to run docker without sudo (requires logout and login to take effect)
sudo usermod -aG docker $USER

echo "Installation of Java, Maven, and Docker completed successfully."
echo "You may need to log out and log back in to apply the docker group changes."

# End of script
