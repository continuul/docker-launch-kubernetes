AWS Kubernetes Launcher
-----------------------

First create your SSH credentials (some default ones are checked in):

    cd ssh
    ssh-keygen -t rsa -b 4096 -f kube_aws_rsa

First build the Docker image:

    ./build

Then modify the credentials file in the aws directory. You may
also want to set the region you want to run in using the aws/config
file.

Then verify any environment variables, tweaks and the like in the
docker-compose.yml file.

Then launch the Docker container:

    docker-compose up

To log into the master, find its public IP address and ssh per:

    ssh -i ssh/kube_aws_rsa admin@ec2-52-206-151-154.compute-1.amazonaws.com
