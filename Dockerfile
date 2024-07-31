FROM quay.io/panubo/php-apache:debian12

ENV PRIVATEBIN_VERSION=1.7.4 \
    PRIVATEBIN_CHECKSUM=ee90331a9a955d1bf7efe178d89a92359092123d1071ee2aab1866c0ab43af97

RUN set -x \
  && wget --no-verbose -O /tmp/PrivateBin-${PRIVATEBIN_VERSION}.tar.gz "https://github.com/PrivateBin/PrivateBin/archive/${PRIVATEBIN_VERSION}.tar.gz" \
  && echo "${PRIVATEBIN_CHECKSUM}  PrivateBin-${PRIVATEBIN_VERSION}.tar.gz" > /tmp/SHA256SUM \
  && ( cd /tmp; sha256sum -c SHA256SUM || ( echo "Expected $(sha256sum PrivateBin-${PRIVATEBIN_VERSION}.tar.gz)"; exit 1; )) \
  && tar -xzf /tmp/PrivateBin-${PRIVATEBIN_VERSION}.tar.gz -C /var/www/html --strip 1 \
  && chown -R root:root /var/www/html \
  && rm -f /tmp/PrivateBin-${PRIVATEBIN_VERSION}.tar.gz /tmp/SHA256SUM \
  && mkdir /srv/remote \
  ;

COPY htaccess /var/www/html/.htaccess
COPY conf.php /var/www/html/cfg/
COPY Mountfile /
