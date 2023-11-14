FROM ubuntu:22.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install npm
RUN npm install -g @dbml/cli
RUN npm install -g @softwaretechnik/dbml-renderer
RUN nodejs --version
RUN sed s/settings?.headercolor/settings.headercolor/ /usr/local/lib/node_modules/@softwaretechnik/dbml-renderer/lib/renderer.js > test
RUN cp test /usr/local/lib/node_modules/@softwaretechnik/dbml-renderer/lib/renderer.js


