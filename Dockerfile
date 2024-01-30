# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile

FROM emqx/mqttx-web:latest

COPY rootfs /

#RUN apt-get update && apt-get install -y bash
RUN apk add --no-cache bash curl jq

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

## bashio via https://github.com/hassio-addons/addon-debian-base/blob/main/base/Dockerfile
RUN curl -J -L -o /tmp/bashio.tar.gz \ 
    "https://github.com/hassio-addons/bashio/archive/v0.16.2.tar.gz"
RUN mkdir /tmp/bashio 
RUN tar zxvf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio 
RUN mv /tmp/bashio/lib /usr/lib/bashio 
RUN ln -s /usr/lib/bashio/bashio /usr/bin/bashio
   
WORKDIR /app
    
RUN bashio /setup.sh
    
# CMD [ "http-server", "-p", "8099" ]
CMD [ "bashio", "/run.sh" ]
