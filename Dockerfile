# Download base image ubuntu latest
FROM ubuntu:latest

# This image contains tools for setting up an Rita client/relay/gateway (here on known as a client) as well as an Althea exit server.
LABEL maintainer="russ@sharkero.com"
LABEL version="0.1"
LABEL description="contains tools for setting up an Rita client/relay/gateway (here on known as a client) as well as an Althea exit serv>

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Install Ansible
RUN apt update
RUN apt install python3-pip libsqlite3-dev libssl-dev build-essential git -y
RUN pip3 install ansible
RUN apt install curl sed -y

# Install hosts file template and Ansible playbook for exit nodes
RUN git clone https://github.com/althea-net/rita-installer.git
RUN git clone https://github.com/kamikaze675/althea-exit-server.git

 # Expose Ports for babel, rita, bounty and wg
EXPOSE 22/tcp 8080 4876/udp 8888/udp 59999/udp
EXPOSE 60000-65000/udp

 # Grab the current public ip address for the host config, run the Althea setup exit server playbook
RUN cp /althea-exit-server/hosts /rita-installer
RUN sed -i "s/.*1.1.1.1*/$(eval curl ident.me) /" /rita-installer/hosts
RUN ansible-playbook -i /rita-installer/hosts rita-installer/install-exit.yml
