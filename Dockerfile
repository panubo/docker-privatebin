FROM docker.io/panubo/php-apache:debian10

ENV PRIVATEBIN_VERSION=1.3.1 PRIVATEBIN_CHECKSUM=a93804b9225aafc6f318a8534f1daade561463f869234e1601be09e54d27d6f5

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
