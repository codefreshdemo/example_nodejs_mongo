FROM node:latest

RUN apt-get update

RUN apt-get install -y netcat
RUN apt-get install -y dnsutils

RUN npm install -g bower grunt-cli gulp mocha

# copy app and install deps
COPY . /src
RUN cd /src;
RUN npm install

RUN chmod +x /src/test-script.sh

EXPOSE 9000

CMD [ "node", "/src/app.js" ]

