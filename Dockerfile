FROM docker.io/panubo/php-apache:debian10

ENV PRIVATEBIN_VERSION=1.3.5 \
    PRIVATEBIN_CHECKSUM=cbee0a8c5ef58ae98cd77982619190356f657e8bbc9e3f429307c65a411bfb80

RUN set -x \
  && wget --no-verbose -O /tmp/PrivateBin-${PRIVATEBIN_VERSION}.tar.gz "https://github.com/PrivateBin/PrivateBin/archive/${PRIVATEBIN_VERSION}.tar.gz" \
  && echo "${PRIVATEBIN_CHECKSUM}  PrivateBin-${PRIVATEBIN_VERSION}.tar.gz" > /tmp/SHA256SUM \
  && ( cd /tmp; sha256sum -c SHA256SUM || ( echo "Expected $(sha256sum PrivateBin-${PRIVATEBIN_VERSION}.tar.gz)"; exit 1; )) \
  && tar -xzf /tmp/PrivateBin-${PRIVATEBIN_VERSION}.tar.gz -C /var/www/html --strip 1 \
  && chown -R root:root /var/www/html \
  && rm -f /tmp/PrivateBin-${PRIVATEBIN_VERSION}.tar.gz /tmp/SHA256SUM \
  ;

COPY htaccess /var/www/html/.htaccess
COPY conf.php /var/www/html/cfg/
COPY Mountfile /var/www/html/
