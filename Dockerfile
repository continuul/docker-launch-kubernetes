FROM ubuntu:latest

MAINTAINER Robert Buck <buck.robert.j@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN apt-get update -y
RUN apt-get -y install curl wget unzip build-essential openssh-server
RUN apt-get install -y python python-dev
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python get-pip.py

RUN pip install awscli

ENV MASTER_SIZE t2.micro
ENV NODE_SIZE t2.micro
ENV NUM_NODES 4
ENV KUBE_AWS_ZONE us-east-1c
ENV INSTANCE_PREFIX kubernetes
ENV MASTER_DISK_TYPE gp2
ENV MASTER_DISK_SIZE 20
ENV MASTER_ROOT_DISK_TYPE gp2
ENV MASTER_ROOT_DISK_SIZE 8
ENV NODE_ROOT_DISK_TYPE gp2
ENV NODE_ROOT_DISK_SIZE 20
ENV ENABLE_CLUSTER_MONITORING grafana
ENV ENABLE_CLUSTER_LOGGING true
ENV ELASTICSEARCH_LOGGING_REPLICAS 3
ENV AWS_S3_REGION us-east-1

ENTRYPOINT export KUBERNETES_PROVIDER=aws; curl -sS https://get.k8s.io | bash
