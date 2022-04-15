FROM debian:stretch
RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# apt CLI is not stable, using apt-get instead
RUN apt-get update

# Essentials
RUN apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
     xterm vim

# Documentation
RUN apt-get install -y make xsltproc docbook-utils fop dblatex xmlto
