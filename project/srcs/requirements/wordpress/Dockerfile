FROM alpine:3.20.2

ARG PHP_VERSION=83 \
    DB_NAME \
    DB_USER \
    DB_PASS \ 
    DB_HOST \
    ADM_WP_NAME \
    ADM_WP_PASS \
    ADM_WP_EMAIL \
    WP_USERNAME \
    WP_USERPASS \
    WP_USEREMAIL \
    WP_TITLE \
    WP_HOST

ENV DB_NAME=$DB_NAME \
    DB_USER=$DB_USER \
    DB_PASS=$DB_PASS \
    DB_HOST=$DB_HOST \
    ADM_WP_NAME=$ADM_WP_NAME \
    ADM_WP_PASS=$ADM_WP_PASS \
    ADM_WP_EMAIL=$ADM_WP_EMAIL \
    WP_USERNAME=$WP_USERNAME \
    WP_USERPASS=$WP_USERPASS \
    WP_USEREMAIL=$WP_USEREMAIL \
    WP_TITLE=$WP_TITLE \
    WP_HOST=$WP_HOST

RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-redis \
    php${PHP_VERSION}-phar \
    php-tokenizer \
    wget \
    unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*
WORKDIR /var/www
RUN wget https://wordpress.org/wordpress-6.6.2.zip && \
    unzip wordpress-6.6.2.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress-6.6.2.zip
RUN wget https://github.com/wp-cli/wp-cli/releases/download/v2.10.0/wp-cli-2.10.0.phar \
    && chmod +x wp-cli-2.10.0.phar && mv wp-cli-2.10.0.phar /usr/local/bin/wp
COPY ./requirements/wordpress/conf/wp-config-create.sh .
RUN chmod +x /var/www/wp-config-create.sh && chmod -R 0777 wp-content/
CMD ["/bin/sh", "-c", "/var/www/wp-config-create.sh && /usr/sbin/php-fpm83 -F"]