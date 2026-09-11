#!/command/with-contenv bashio
# ==============================================================================
# Подготовка BrickCollector: ключ, схема, справочник, кэши.
# ==============================================================================
# shellcheck source=/dev/null
source /usr/lib/brickcollector.sh

readonly DATA=/config

mkdir -p "${DATA}/images"

if ! bashio::fs.file_exists "${DATA}/app_key"; then
    bashio::log.info "Первый запуск: генерирую ключ приложения"
    php -r 'echo "base64:".base64_encode(random_bytes(32));' > "${DATA}/app_key"
fi

brickcollector::environment

# Миграции идемпотентны: гонять их каждый старт дешевле, чем угадывать, было ли
# обновление аддона.
bashio::log.info "Проверяю схему базы"
php /app/artisan migrate --force --no-interaction \
    || bashio::exit.nok "Не удалось применить миграции"

#
# Справочник BrickLink. Архив остаётся рядом с базой: он же нужен следующему
# обновлению, чтобы сравнить CRC32 и не тянуть всё заново.
#
if bashio::config.true 'import_catalog'; then
    if ! bashio::fs.file_exists "${DATA}/downloads.zip"; then
        bashio::log.info "Скачиваю справочник, около 38 МБ"

        if curl -fsSL --retry 3 -o "${DATA}/downloads.zip.part" "$(bashio::config 'catalog_url')"; then
            mv "${DATA}/downloads.zip.part" "${DATA}/downloads.zip"
        else
            rm -f "${DATA}/downloads.zip.part"
            bashio::log.warning "Скачать справочник не вышло — поиск по каталогу будет пуст"
        fi
    fi

    # Отметка о ввозе лежит рядом с архивом. Заменили архив на свежий — она
    # окажется старше него, и справочник переедет заново.
    if bashio::fs.file_exists "${DATA}/downloads.zip" \
        && [[ ! -f "${DATA}/catalog.imported" || "${DATA}/downloads.zip" -nt "${DATA}/catalog.imported" ]]; then

        bashio::log.info "Импортирую справочник: 175 тысяч предметов, на слабой машине это минуты"

        if php /app/artisan catalog:import; then
            touch "${DATA}/catalog.imported"
        else
            bashio::log.warning "Импорт справочника не удался, приложение поднимется без него"
        fi
    fi
fi

#
# Кэши собираем здесь, а не в образе: значения зависят от настроек аддона,
# которые известны только сейчас.
#
php /app/artisan config:cache
php /app/artisan route:cache
php /app/artisan view:cache

bashio::log.info "BrickCollector готов, панель — в боковом меню Home Assistant"
