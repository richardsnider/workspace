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

RUN useradd --create-home --system --home /home/user --shell /bin/bash --groups sudo --uid 1000 user 
RUN echo "user:pass" | chpasswd

ENV HOME=/home/user
ENV BUILD_DIRECTORY=$HOME/build
WORKDIR $HOME

ADD --chown=user ./build/scripts /usr/local/bin
RUN chmod +x /usr/local/bin/*.sh

ADD --chown=user ./build/.bashrc $HOME/.bashrc
RUN chmod +x $HOME/.bashrc

# Install brew via git clone as directed by https://docs.brew.sh/Homebrew-on-Linux#alternative-installation
RUN git clone https://github.com/Homebrew/brew $HOME/.linuxbrew/Homebrew
RUN mkdir $HOME/.linuxbrew/bin
RUN ln -s $HOME/.linuxbrew/Homebrew/bin/brew $HOME/.linuxbrew/bin
RUN eval $($HOME/.linuxbrew/bin/brew shellenv)
RUN brew update
RUN brew upgrade
RUN brew install sops
RUN brew install kubectl
RUN brew install kops
RUN brew install helm
RUN chown --recursive user $HOME/.linuxbrew

# Install nodejs as directed by https://github.com/nodesource/distributions/blob/master/README.md#debinstall
RUN curl --silent https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# Install AWS CLI as directed by https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$HOME/awscliv2.zip"
RUN unzip $HOME/awscliv2.zip
RUN $HOME/aws/install
RUN rm -rf $HOME/aws $HOME/awscliv2.zip

RUN service ssh start

EXPOSE 22 25 53 80 8000-8100
CMD    ["/usr/sbin/sshd", "-D"]
