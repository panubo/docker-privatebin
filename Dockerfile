FROM docker.io/panubo/php-apache:debian8

MAINTAINER Andrew Cutler <andrew@panubo.io>

ENV PRIVATEBIN_VERSION=1.1 PRIVATEBIN_SRC=https://github.com/PrivateBin/PrivateBin.git

RUN git clone $PRIVATEBIN_SRC . && \
    git checkout $PRIVATEBIN_VERSION && \
    [ "$PRIVATEBIN_VERSION" != 'master' ] && git checkout tags/$PRIVATEBIN_VERSION || git checkout master && \
    rm -rf .git && \
    mv .htaccess.disabled .htaccess
