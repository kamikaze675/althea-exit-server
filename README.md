# althea-exit-server
This project allows you to spin up Althea exit node inside a container

These steps should get you to the point the exit server runs, be aware it is usig the default payout ethereum address

You need to have docker installed, "sudo apt install docker.io" and then verify docker works with "docker run hello-world"

#To create the docker build file use:
 sudo docker build -t althea-exit-server-image .

#Then to kick off an interactive session
sudo docker run -t -i --privileged althea-exit-server-image

