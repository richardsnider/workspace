FROM registry.hub.docker.com/library/ubuntu:20.04

ENV TERM=xterm
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get --quiet update
RUN apt-get install --yes apt-utils
RUN apt-get install --yes software-properties-common
RUN apt-get --quiet update
RUN apt-get upgrade --yes
RUN apt-get autoremove --yes

RUN apt-get install --yes sudo
RUN apt-get install --yes locales
RUN apt-get install --yes build-essential
RUN apt-get install --yes net-tools
RUN apt-get install --yes wget
RUN apt-get install --yes curl
RUN apt-get install --yes apt-transport-https
RUN apt-get install --yes ca-certificates
RUN apt-get install --yes openssh-server
RUN apt-get install --yes sshfs
RUN apt-get install --yes vim
RUN apt-get install --yes file
RUN apt-get install --yes gnupg
RUN apt-get install --yes bzip2
RUN apt-get install --yes python-numpy
RUN apt-get install --yes unzip
RUN apt-get install --yes jq
RUN apt-get install --yes git

# RUN useradd --password pass --uid 1000 user
ENV HOME=/home/user
ENV BUILD_DIRECTORY=$HOME/build
WORKDIR $HOME

# ADD --chown=user ./build $BUILD_DIRECTORY
# RUN chmod +x $BUILD_DIRECTORY/*.sh 
# RUN $BUILD_DIRECTORY/setup.sh

RUN useradd --create-home --system --home /home/user --shell /bin/bash --gid root --groups sudo --uid 1000 user 
RUN echo "user:pass" | chpasswd
RUN service ssh start

# USER 1000

EXPOSE 22 25 53 80 8000-8100
CMD    ["/usr/sbin/sshd", "-D"]
