# althea-exit-server
This project allows you to spin up Althea exit node inside a container

These steps should get you to the point the exit server runs, be aware it is usig the default payout ethereum address

You need to have docker installed, "sudo apt install docker.io" and then verify docker works with "docker run hello-world"

First edit `rita_exit.toml` with your wireguard and Eth keys

# Build the docker image
docker build -t althea-exit-server-image .

# Start a session
docker run -t -i --privileged althea-exit-server-image

