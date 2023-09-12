# Download base image ubuntu latest
FROM ubuntu:latest

# This image contains tools for setting up an Rita client/relay/gateway (here on known as a client) as well as an Althea exit server. 
LABEL maintainer="russ@sharkero.com"
LABEL version="0.1"
LABEL description="contains tools for setting up an Rita client/relay/gateway (here on known as a client) as well as an Althea exit server."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Install Ansible
RUN apt update
RUN apt install python3-pip libsqlite3-dev libssl-dev build-essential -y
RUN pip3 install ansible

# Install hosts file template and Ansible playbook for exit nodes
RUN git clone https://github.com/althea-net/rita-installer.git

 # Expose Port for the Application 
EXPOSE 4875 51820
