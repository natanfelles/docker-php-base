FROM debian:buster
ENV TERM=linux
RUN apt-get update \
	&& apt-get -y --no-install-recommends install \
	apt-utils \
	ca-certificates \
	curl \
	geoip-database \
	geoip-database-extra \
	git \
	unzip \
	php-apcu \
	php-geoip \
	php-igbinary \
	php-memcached \
	php-msgpack \
	php-redis \
	php-xdebug \
	php7.3-cli \
	php7.3-curl \
	php7.3-fpm \
	php7.3-gd \
	php7.3-imap \
	php7.3-intl \
	php7.3-json \
	php7.3-mbstring \
	php7.3-mysql \
	php7.3-opcache \
	php7.3-readline \
	php7.3-xml \
	php7.3-yaml \
	php7.3-zip \
	&& apt-get clean \
	&& curl -sS https://getcomposer.org/installer \
	| php -- --install-dir=/usr/local/bin --filename=composer \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
CMD ["php", "-a"]
