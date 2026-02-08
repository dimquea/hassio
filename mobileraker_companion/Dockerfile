ARG BUILD_FROM=ghcr.io/hassio-addons/base-python:18.0.0
FROM ${BUILD_FROM}

ARG COMPANION_VERSION

ENV PATH="/root/.local/bin:${PATH}"

WORKDIR /var/mobileraker_companion

# Install dependencies
RUN apk add --no-cache \
    unzip \
    zlib-dev \
    tiff \
    libjpeg-turbo-dev \
    openjpeg \
    py3-pip \
    py3-virtualenv

# Donwload files
RUN source_url=$(curl -s https://api.github.com/repos/Clon1998/mobileraker_companion/releases/tags/${COMPANION_VERSION} | jq -r '.zipball_url') \
    && curl -sSL $source_url -o /tmp/temp.zip \
    && unzip /tmp/temp.zip -d /var/temp \
    && rm /tmp/temp.zip \
    && dirname=$(ls /var/temp/) \
    && mv /var/temp/$dirname/* /var/mobileraker_companion \
    && mv /var/mobileraker_companion/scripts/mobileraker-requirements.txt /var/mobileraker_companion/mobileraker-requirements.txt \
    && rm -f -r /var/temp/ \
    && rm -f -r scripts tests LICENSE README.md Dockerfile \
    && chmod a+x /var/mobileraker_companion/mobileraker.py

COPY --chmod=a+x ./scripts/install.sh /var/mobileraker_companion/install.sh
COPY --chmod=a+x ./scripts/start.sh /var/mobileraker_companion/start.sh

RUN bash /var/mobileraker_companion/install.sh

# Run command
ENTRYPOINT ["bashio", "/var/mobileraker_companion/start.sh"]