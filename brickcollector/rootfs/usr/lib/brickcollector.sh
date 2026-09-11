#!/usr/bin/env bash
# ==============================================================================
# Общее окружение BrickCollector.
#
# Подключается и разовой инициализацией, и службой php-fpm: настройки аддона
# нужны и артизану при старте, и воркерам при каждом запросе.
# ==============================================================================

readonly BRICKCOLLECTOR_DATA=/config

brickcollector::environment() {
    export APP_ENV=production
    export APP_DEBUG=false
    export LOG_CHANNEL=stderr

    # Всё изменяемое живёт вне образа: контейнер аддона пересоздаётся при каждом
    # обновлении. /config — это папка аддона в addon_configs.
    export BRICKCOLLECTOR_DATA_PATH="${BRICKCOLLECTOR_DATA}"

    # Разрешаем верить заголовку X-Ingress-Path. Порт наружу не выставлен,
    # подделать его снаружи некому.
    export BRICKCOLLECTOR_TRUST_INGRESS=true

    # Чем запускать artisan для обновления справочника из интерфейса: угадать
    # это изнутри php-fpm нельзя, там PHP_BINARY указывает на сам php-fpm.
    export BRICKCOLLECTOR_PHP_BINARY=/usr/bin/php

    # Сессии — файлами: импорт справочника держит на базе одну длинную пишущую
    # транзакцию, и с сессиями в базе на это время ложится вся панель.
    export SESSION_DRIVER=file

    export APP_LOCALE="$(bashio::config 'locale')"
    export APP_FALLBACK_LOCALE=en
    export BRICKCOLLECTOR_CURRENCY="$(bashio::config 'currency')"

    if bashio::config.equals 'log_level' 'debug' || bashio::config.equals 'log_level' 'trace'; then
        export APP_DEBUG=true
    fi

    # Ключ переживает пересоздание контейнера, поэтому лежит рядом с базой:
    # им подписываются сессии и шифруются значения.
    export APP_KEY="$(cat "${BRICKCOLLECTOR_DATA}/app_key")"
}
