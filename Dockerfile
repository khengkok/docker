FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install -y software-properties-common
RUN AZ_REPO=$(cat /etc/lsb-release  | grep DISTRIB_CODENAME| cut -d= -f2)
RUN echo $AZ_REPO
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ xenial  main" | tee /etc/apt/sources.list.d/azure-cli.list
RUN apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893
RUN apt-get install -y apt-transport-https
RUN apt-get update && apt-get install -y  azure-cli
RUN add-apt-repository -y ppa:jonathonf/python-3.6
RUN apt-get update
RUN apt-get install -y python3.6
RUN apt-get install -y python3-pip
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1 
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
RUN update-alternatives --config python3
RUN pip3 install --upgrade pip
RUN pip3 install awscli --upgrade --user
RUN apt-get install -y nano
RUN echo "export PATH=~/.local/bin:$PATH" >> /root/.profile
ENTRYPOINT bash --login
