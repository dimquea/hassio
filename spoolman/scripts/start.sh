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

/var/spoolman/scripts/start.sh