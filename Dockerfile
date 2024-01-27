# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile

FROM emqx/mqttx-web:latest

## docker -p external:internal
#docker pull emqx/mqttx-web
#docker run -d --name mqttx-web -p 80:80 emqx/mqttx-web

# RUN apt-get -y update && apt-get install -y fortunes
# CMD /usr/games/fortune -a | cowsay

#ARG BUILD_FROM
#FROM $BUILD_FROM

# Execute during the build of the image
#ARG TEMPIO_VERSION BUILD_ARCH
#RUN curl -sSLf -o /usr/bin/tempio     "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}"

# Copy root filesystem

COPY rootfs /

