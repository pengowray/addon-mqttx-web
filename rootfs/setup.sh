#!/bin/bash bashio

#!/usr/bin/with-contenv bashio
# ==============================================================================
# Start the example service
# s6-overlay docs: https://github.com/just-containers/s6-overlay
# ==============================================================================

# Add your code here

# Declare variables
#declare message

## Get the 'message' key from the user config options.
#message=$(bashio::config 'message')

## Print the message the user supplied, defaults to "Hello World..."
bashio::log.info "${message:="Setting up..."}"

## Run your program
#exec /usr/bin/my_program

export NODE_ENV='production'
export BASE_URL='$(bashio::addon.ingress_entry)'
export VUE_APP_PAGE_TITLE='MQTTX Web for Home Assistant'
export VUE_APP_PAGE_DESCRIPTION='Local MQTT 5.0 client, using MQTT over WebSocket to connect to the MQTT Broker'

cd /app
echo "NODE_ENV=production" > .env.local
echo "BASE_URL=$(bashio::addon.ingress_entry)" >> .env.local 
echo "VUE_APP_PAGE_TITLE=MQTTX Web for Home Assistant" >> .env.local
echo "VUE_APP_PAGE_DESCRIPTION=Local MQTT 5.0 client, using MQTT over WebSocket to connect to the MQTT Broker." >> .env.local

bashio::log.info "Ready..."

#bashio::log.info "${USERNAME}"