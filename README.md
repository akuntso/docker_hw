# Docker Network and Netcat Project

This project demonstrates how to create two Docker containers with an Alpine Linux image, set up a custom network, and run scripts to transmit data between them using netcat.

## Description

- Two containers with an Alpine image.
- `nc_client.sh` and `nc_server.sh` scripts that use netcat to transfer data between the containers.
- A custom Docker network (not the default network).
- Docker Volumes are used to ensure access to scripts from the host machine.

## Step-by-Step Instructions

### 1. Clone the Repository. Clone this repository to your local machine:
```sh
git clone https://github.com/yourusername/docker_hw.git
cd docker_hw
```
### 2. Build Docker Images. Navigate to the directory with the Dockerfile and build the images for the server and the client.
- For the server
```sh
docker build -t myserver -f Dockerfile .
```
- For the client
```sh
docker build -t myclient -f Dockerfile .
```
### 3. Create a custom bridge network for the containers:
```sh
docker network create bridge my_bridge_network
```
### 4. Run the servers container:
```sh
docker run -it -d --name server-container --network my_bridge_network myserver
docker run -it -d --name client-container --network my_bridge_network myserver
```
### 5. To verify that the containers can communicate with each other, access the client containe. Inside the client container, you can test the connection to the server using ping or netcat or other tools.
```sh
docker exec -it client-container /bin/sh
ping "ip server-container"
```
### 6. Run the script on the client to send data to the server
- Execute server-container
```sh
- docker exec -it server-container /bin/sh
- ./nc_server.sh
```
- Execute client-container
```sh
- docker exec -it client-container /bin/sh
- ./nc_client.sh
```
## File Structure
Dockerfile - Dockerfile for the client and server containers.
client.sh - A script that initiates a connection to the server and sends data.
server.sh - A script that accepts data from the client.
README.md - Project description and instructions.