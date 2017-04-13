FROM node:latest

RUN apt-get update

#-yq && apt-get upgrade -yq && \
#   apt-get install -yq curl git ssh sshpass
#RUN apt-get -q -y install nodejs npm build-essential

RUN apt-get install -y netcat
RUN apt-get install -y dnsutils

#RUN ln -s "$(which nodejs)" /usr/bin/node

RUN npm install -g bower grunt-cli gulp

# copy app and install deps
COPY . /src
RUN cd /src;
RUN npm install

RUN chmod +x /src/test-script.sh

EXPOSE 9000

CMD [ "node", "/src/app.js" ]

