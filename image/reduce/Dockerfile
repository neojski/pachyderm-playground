FROM node

ADD src/package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /bin

ADD src/reduce.js    /bin/reduce

EXPOSE 80
