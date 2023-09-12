# althea-exit-server
This project allows you to spin up Althea exit node inside a container

These steps should get you to the point the container runs, still need to edit the default hosts with wireguard keys to make it operational

You need to have docker installed, "sudo apt install docker.io" and then verify docker works with "docker run hello-world"

git clone (https://github.com/kamikaze675/althea-exit-server.git

cd althea-exit-server

#To create the docker build file use:
 sudo docker build -t althea-exit-server-image .

#Then to kick off an interactive session
sudo docker run -t -i --privileged althea-exit-server-image

You can try to use the default hosts file from Rita using ansible

cd rita-installer

ansible-playbook -i hosts install-exit.yml


TODO:
Load up hosts file with test entries
