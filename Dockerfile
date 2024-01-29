# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile

FROM emqx/mqttx-web:latest

# RUN apk add --no-cache nginx=1.24.0-r14

COPY rootfs /

## ha-proxy.js didn't work
#RUN npm install express http-proxy-middleware
#RUN node /app2/ha-proxy.js

## start ngnix etc
RUN chmod +x /run.sh
# RUN /run.sh

## done by emqx/mqttx-web
#WORKDIR /app
#RUN http-server -p 80
