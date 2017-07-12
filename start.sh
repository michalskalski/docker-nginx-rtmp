#!/bin/ash

# Convert environment variables in the conf to fixed entries
# http://stackoverflow.com/questions/21056450/how-to-inject-environment-variables-in-varnish-configuration
for name in HLS_STREAM_SOURCE
do
    eval value=\$$name
    sed -i "s|\${${name}}|${value}|g" /opt/nginx/nginx.conf
done

/opt/nginx/sbin/nginx
