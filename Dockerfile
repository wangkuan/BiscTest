FROM ubuntu:14.04
MAINTAINER louis wang "louis.wang@makeblock.cc"

RUN apt-get update -y
RUN apt-get upgrade -y
# install git
RUN apt-get install git wget gcc g++ make python -y

# install nodejs
RUN cd /tmp && wget https://nodejs.org/dist/v4.4.3/node-v4.4.3.tar.gz && tar -zvxf node-v4.4.3.tar.gz
RUN cd /tmp/node-v4.4.3 && ./configure && make -s && make install

# pull source code
RUN cd ~ && git clone https://github.com/wangkuan/BiscTest.git

# npm install
RUN cd ~/BiscTest && npm install

# Expose ports.
EXPOSE 1337

# Define default command.
ENTRYPOINT cd ~/BiscTest && node app.js
