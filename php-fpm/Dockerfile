FROM php:8.4-fpm-alpine

ARG IMAGICK_COMMIT="b47e91c83b0eb8db951794d0ed363ae20748b795"

RUN set -eux \
    && apk add --no-cache \
        c-client \
        ca-certificates \
        freetds \
        freetype \
        gettext \
        gmp \
        icu-libs \
        imagemagick \
        libgmpxx \
        libintl \
        libjpeg-turbo \
        libpng \
        libpq \
        libssh2 \
        libstdc++ \
        libtool \
        libxpm \
        libxslt \
        libzip \
        lz4-libs \
        rabbitmq-c \
        tidyhtml \
        tzdata \
        unixodbc \
        yaml \
        zstd-libs \
	libldap \
	libwebp

RUN set -eux \
    && apk add --no-cache --virtual .build-deps \
        autoconf \
        bzip2-dev \
        cmake \
        curl-dev \
        freetds-dev \
        freetype-dev \
        g++ \
        gcc \
        gettext-dev \
        git \
	make \
        gmp-dev \
        icu-dev \
        imagemagick-dev \
        krb5-dev \
        libc-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        librdkafka-dev \
        libssh2-dev \
        libwebp-dev \
        libxml2-dev \
        libxpm-dev \
        libxslt-dev \
        libzip-dev \
        lz4-dev \
        openssl-dev \
        pcre-dev \
        pkgconf \
        postgresql-dev \
        rabbitmq-c-dev \
        tidyhtml-dev \
        unixodbc-dev \
        vips-dev \
        yaml-dev \
        zlib-dev \
        zstd-dev \
	openldap-dev \
    && ln -s /usr/lib /usr/local/lib64 \
################################
# Install PHP extensions
################################
# Install imagick from source (temporarily)
    && mkdir -p /opt/imagick \
    && cd /opt/imagick \
    && git init \
    && git remote add origin https://github.com/Imagick/imagick.git \
    && git fetch origin ${IMAGICK_COMMIT} \
    && git checkout ${IMAGICK_COMMIT} \
    && phpize && ./configure \
    && make -j$(nproc) \
    && make -j$(nproc) install \
# Install lz4
    && git clone https://github.com/kjdev/php-ext-lz4 /opt/lz4 \
    && cd /opt/lz4 \
    && git checkout $(git tag | grep -E '^[.0-9]+$' | sort -V | tail -1) \
    && phpize \
    && ./configure --enable-lz4 --with-lz4-includedir=/usr \
    && make -j$(nproc) \
    && make install \
    && cd / && rm -rf /opt/imagick && rm -rf /opt/lz4 \
# Configure
    && ln -s /usr/lib/$(apk --print-arch)-linux-gnu/libXpm.* /usr/lib/ \
    && docker-php-ext-configure gd \
        --enable-gd \
        --with-webp \
        --with-jpeg \
        --with-xpm \
        --with-freetype \
        --enable-gd-jis-conv \
    && docker-php-ext-configure pdo_mysql \
    && docker-php-ext-configure zip --with-zip \
# Pecl Install
    && pecl install amqp apcu memcache mongodb uuid yaml zstd ssh2-1.3.1 \
    && pecl install --configureoptions \
        'enable-redis-zstd="yes" enable-redis-lz4="yes"' \
        redis \
    && docker-php-ext-enable amqp apcu memcache mongodb uuid yaml zstd ssh2 redis imagick lz4 \
# Ext Install
    && docker-php-ext-install -j$(nproc) gettext gmp bcmath bz2 exif gd calendar ftp ldap \
        pdo_mysql mysqli pdo_dblib pdo_pgsql pgsql intl opcache pcntl soap tidy xsl zip \
# Install sockets, sysvmsg, sysvsem, sysvshm (also needed by swoole)
    && CFLAGS="${CFLAGS:=} -D_GNU_SOURCE" docker-php-ext-install -j$(nproc) \
        sockets \
        sysvmsg \
        sysvsem \
        sysvshm \
# Clean up build packages
    && docker-php-source delete \
    && apk del --no-network .build-deps \
    && rm -rf /tmp/* && rm -rf /usr/local/lib/php/test/mongodb/tests \
    && (find /usr/local/bin -type f -print0 | xargs -n1 -0 strip --strip-all -p 2>/dev/null || true) \
    && (find /usr/local/lib -type f -print0 | xargs -n1 -0 strip --strip-all -p 2>/dev/null || true) \
    && (find /usr/local/sbin -type f -print0 | xargs -n1 -0 strip --strip-all -p 2>/dev/null || true) \
    && rm -rf /usr/local/etc/php-fpm.d/zz-docker.conf \
    && rm -rf /usr/local/etc/php-fpm.d/docker.conf \
    && rm -rf /usr/local/etc/php-fpm.d/www.conf.default

COPY php-fpm.conf /usr/local/etc/php-fpm.conf
COPY pool.conf /usr/local/etc/php-fpm.d/www.conf

EXPOSE 9000
CMD ["php-fpm"]
