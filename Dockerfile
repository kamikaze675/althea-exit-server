# Download base image debian latest
FROM debian:latest

# This image contains tools for setting up an Rita client/relay/gateway (here on known as a client) as well as an Althea exit server.
LABEL maintainer="russ@sharkero.com"
LABEL version="0.1"
LABEL description="contains tools for setting up an Rita client/relay/gateway (here on known as a client) as well as an Althea exit server"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Install Ansible
RUN apt update
RUN apt install -y iptables-persistent iproute2 ebtables ipset wireguard vlan linux-headers-cloud-amd64 libpq-dev postgresql-client
ADD https://github.com/althea-net/rita/releases/download/Beta21RC2/rita-exit-refs.tags.Beta21RC2-x86_64 /bin/rita_exit
ADD https://github.com/althea-net/babeld/releases/download/0.1.6/babeld /bin/babeld
RUN chmod +x /bin/babeld
RUN chmod +x /bin/rita_exit
ADD start.sh .
ADD rita_exit.toml .
ADD babeld.conf .

 # Expose Ports for babel, rita, bounty and wg
EXPOSE 4874-4877/udp 59999/udp
EXPOSE 59998-64998/udp

 # Grab the current public ip address for the host config, run the Althea setup exit server playbook
ENTRYPOINT /bin/bash start.sh
