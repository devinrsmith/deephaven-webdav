# syntax=docker/dockerfile:1.4

# ---------------------------------

FROM caddy:2.6.1-builder AS builder
ARG CADDY_WEBDAV_VERSION=14bd56b1afc9b1f5a7402e678f25f41dddda26a7
RUN xcaddy build \
    --with github.com/mholt/caddy-webdav@${CADDY_WEBDAV_VERSION}

# ---------------------------------

FROM ubuntu:22.04
RUN set -eux; \
    mkdir -p /etc/caddy
COPY --link Caddyfile /etc/caddy/Caddyfile
COPY --link --from=builder /usr/bin/caddy /usr/bin/caddy

EXPOSE 80

WORKDIR /srv
VOLUME [ "/srv/webdav" ]

ENTRYPOINT [ "/usr/bin/caddy" ]

CMD ["run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]

# ---------------------------------
