#!/bin/bashio

# ANSI color codes
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${ORANGE}Updating enviroment${NC}"

export SPOOLMAN_DB_TYPE=sqlite
export SPOOLMAN_DIR_DATA=/config
export SPOOLMAN_DIR_BACKUPS=/config/backups
export SPOOLMAN_DIR_LOGS=/config
export SPOOLMAN_HOST=0.0.0.0
export SPOOLMAN_PORT=7912
if bashio::config.has_value 'base_path' ;then
    SPOOLMAN_BASE_PATH=$(bashio::config 'base_path')
    export SPOOLMAN_BASE_PATH
fi
SPOOLMAN_DEBUG_MODE=$(bashio::config 'debug_mode')
export SPOOLMAN_DEBUG_MODE
SPOOLMAN_LOGGING_LEVEL=$(bashio::config 'log_level')
export SPOOLMAN_LOGGING_LEVEL
SPOOLMAN_AUTOMATIC_BACKUP=$(bashio::config 'auto_backup')
export SPOOLMAN_AUTOMATIC_BACKUP
SPOOLMAN_LEGACY_CLIENT=$(bashio::config 'legacy_client')
export SPOOLMAN_LEGACY_CLIENT
if bashio::config.has_value 'cors_origin' ;then
    SPOOLMAN_CORS_ORIGIN=$(bashio::config 'cors_origin | join(",")')
    export SPOOLMAN_CORS_ORIGIN
fi
if bashio::config.has_value 'allowed_hosts' ;then
    SPOOLMAN_ALLOWED_HOSTS=$(bashio::config 'allowed_hosts | join(",")')
    export SPOOLMAN_ALLOWED_HOSTS
fi

# The Home Assistant Ingress panel reaches Spoolman on this same port. Two
# options make the panel unusable; warn so the log explains the symptom.
if bashio::config.has_value 'base_path' ;then
    bashio::log.warning \
        "base_path is set, so the Home Assistant panel will not work." \
        "Ingress supplies its own prefix. Use http://<host>:7912/${SPOOLMAN_BASE_PATH#/} instead."
fi
if bashio::config.true 'legacy_client' ;then
    bashio::log.warning \
        "legacy_client is enabled. The Home Assistant panel does not support the" \
        "legacy React client; use http://<host>:7912 instead."
fi

/var/spoolman/scripts/start.sh
