ARG BUILD_FROM=ghcr.io/hassio-addons/base:21.0.0
FROM ${BUILD_FROM}

# Тег приложения, а не ветка: пересборка аддона должна давать то же самое, что
# и в прошлый раз, а не «то, что сейчас в main».
ARG BRICKCOLLECTOR_REF=1.1.0

WORKDIR /app

# Рантайм: nginx отдаёт статику и передаёт PHP в php-fpm.
RUN apk update && apk add --no-cache \
        nginx \
        php84 \
        php84-fpm \
        php84-ctype \
        php84-curl \
        php84-dom \
        php84-fileinfo \
        php84-iconv \
        php84-mbstring \
        php84-opcache \
        php84-openssl \
        php84-pdo \
        php84-pdo_sqlite \
        php84-phar \
        php84-session \
        php84-simplexml \
        php84-sqlite3 \
        php84-tokenizer \
        php84-xml \
        php84-xmlreader \
        php84-xmlwriter \
        php84-zip \
    && ln -sf /usr/bin/php84 /usr/bin/php

# Сборка. Composer берём готовым phar, а не пакетом Alpine и не установщиком:
# пакет тянет за собой собственный PHP и перехватывает /usr/bin/php, а
# установщик спотыкается о сжатый ответ. Инструменты сборки уходят в этом же
# слое, поэтому в образ не попадают.
RUN apk add --no-cache --virtual .build-deps git nodejs npm \
    && ln -sf /usr/bin/php84 /usr/bin/php \
    && curl -sSLo /usr/local/bin/composer \
        https://getcomposer.org/download/latest-stable/composer.phar \
    && chmod a+x /usr/local/bin/composer \
    && git clone --depth 1 --branch "${BRICKCOLLECTOR_REF}" \
        https://github.com/dimquea/BrickCollector.git /app \
    && composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader \
    && npm ci --no-audit --no-fund \
    && npm run build \
    && rm -rf node_modules /root/.npm /root/.composer /root/.cache \
        /usr/local/bin/composer /app/.git /app/tests \
    && apk del .build-deps \
    && ln -sf /usr/bin/php84 /usr/bin/php

# s6 базового образа поднимает обе службы и присматривает за ними: если php-fpm
# умрёт, nginx не должен остаться отдавать 502 в одиночку.
COPY rootfs /

RUN chmod a+x /etc/cont-init.d/brickcollector.sh \
        /etc/services.d/nginx/run /etc/services.d/nginx/finish \
        /etc/services.d/php-fpm/run /etc/services.d/php-fpm/finish \
        /etc/services.d/images/run /etc/services.d/images/finish \
    && rm -f /etc/php84/php-fpm.d/www.conf \
        /etc/nginx/http.d/default.conf /etc/nginx/conf.d/default.conf \
    && mkdir -p /run/nginx /var/lib/nginx/tmp \
        /app/storage/framework/cache/data /app/storage/framework/sessions \
        /app/storage/framework/views /app/storage/logs /app/bootstrap/cache \
    && chmod -R 0777 /app/storage /app/bootstrap/cache

EXPOSE 8099
