#!/usr/bin/env bashio
# ==============================================================================
/etc/cont-init.d/banner.sh
/etc/cont-init.d/nginx.sh

# Start NGiNX
/etc/services.d/nginx/run &

## Start MQTTX Web
# cd /app
# /app/http-server -p 80
