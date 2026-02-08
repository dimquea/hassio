#!/bin/sh

echo -e "Updating conf"

rm -f /config/mobileraker.conf

conf=""
nl=$'\n'
if bashio::config.has_value 'printers' ;then
    for printer in $(bashio::config 'printers|keys') ;do
        name=$(bashio::config "printers[${printer}].name")
        conf="$conf[printer $name]$nl"

        uri=$(bashio::config "printers[${printer}].moonraker_uri")
        conf="$conf  moonraker_uri: $uri$nl"

        key=$(bashio::config "printers[${printer}].moonraker_api_key")
        if [ $key != "null" ] ;then
            conf="$conf  moonraker_api_key: $key$nl"
        fi

        conf="$conf$nl"
    done
fi

echo "$conf" > /config/mobileraker.conf
echo "$conf"

ls

ENV_DIR="${HOME}/mobileraker-env"
source $ENV_DIR/bin/activate

python mobileraker.py -c /config/mobileraker.conf