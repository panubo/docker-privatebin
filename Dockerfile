FROM docker.io/panubo/php-apache:debian10

ENV PRIVATEBIN_VERSION=1.3.4 PRIVATEBIN_CHECKSUM=0dad8976d823a01de8affb4136bd205f2e5ae418c01e560a0d84f94da7a78749

RUN set -x \
  && wget --no-verbose -O /tmp/PrivateBin-${PRIVATEBIN_VERSION}.tar.gz "https://github.com/PrivateBin/PrivateBin/archive/${PRIVATEBIN_VERSION}.tar.gz" \
  && echo "${PRIVATEBIN_CHECKSUM}  PrivateBin-${PRIVATEBIN_VERSION}.tar.gz" > /tmp/SHA256SUM \
  && ( cd /tmp; sha256sum -c SHA256SUM; ) \
  && tar -xzf /tmp/PrivateBin-${PRIVATEBIN_VERSION}.tar.gz -C /var/www/html --strip 1 \
  && chown -R root:root /var/www/html \
  && rm -f /tmp/PrivateBin-${PRIVATEBIN_VERSION}.tar.gz /tmp/SHA256SUM \
  ;

COPY htaccess /var/www/html/.htaccess
COPY conf.php /var/www/html/cfg/
COPY Mountfile /var/www/html/
