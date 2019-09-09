FROM node:latest

RUN apt-get update

RUN apt-get install -y netcat
RUN apt-get install -y dnsutils

RUN npm install -g bower grunt-cli gulp mocha

# copy app and install deps
COPY . /src
RUN cd /src && npm install

EXPOSE 9000

ENV MONGO_PORT 27017

CMD [ "node", "/src/server.js" ]

