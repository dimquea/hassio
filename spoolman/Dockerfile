ARG BUILD_FROM=ghcr.io/hassio-addons/base:20.0.1
FROM ${BUILD_FROM}

ARG SPOOLMAN_VERSION

ENV PATH="/root/.local/bin:${PATH}"

WORKDIR /var/spoolman

COPY ./scripts/install.sh /var/spoolman/install.sh
COPY ./scripts/start.sh /var/spoolman/start.sh

# Install dependencies
RUN apk add --no-cache \
    unzip \
    g++ \
    python3-dev \
    libffi-dev \
    py3-virtualenv \
    && source_url=$(curl -s https://api.github.com/repos/Donkie/Spoolman/releases/tags/${SPOOLMAN_VERSION} | jq -r '.assets[] | select(.name == "spoolman.zip").browser_download_url') \
    && curl -sSL $source_url -o /tmp/temp.zip \
    && unzip /tmp/temp.zip -d /var/spoolman \
    && touch /var/spoolman/.env \
    && rm /tmp/temp.zip \
    && rm -f -r tests_integration LICENSE README.md Dockerfile \
    && chmod a+x /var/spoolman/install.sh \
    && chmod a+x /var/spoolman/start.sh \
    && bash /var/spoolman/install.sh

# Run command
EXPOSE 7912
ENTRYPOINT ["bashio", "/var/spoolman/start.sh"]