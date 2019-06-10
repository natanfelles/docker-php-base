FROM debian:buster
ENV TERM=linux
RUN echo "debconf debconf/frontend select Noninteractive" \
		| debconf-set-selections; \
	apt-get update \
	&& apt-get -y --no-install-recommends install \
	ca-certificates \
	curl \
	geoip-database \
	geoip-database-extra \
	git \
	graphviz \
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
	unzip \
	&& apt-get clean \
	&& curl -sS https://getcomposer.org/installer \
		| php -- --install-dir=/usr/local/bin --filename=composer \
	&& curl -sSL https://github.com/phpDocumentor/phpDocumentor2/releases/download/v3.0.0-alpha.3/phpDocumentor.phar -o /usr/local/bin/phpDocumentor.phar \
	&& curl -sSL https://github.com/phpDocumentor/phpDocumentor2/releases/download/v3.0.0-alpha.3/phpDocumentor.phar.pubkey -o /usr/local/bin/phpDocumentor.phar.pubkey \
	&& chmod +x /usr/local/bin/phpDocumentor.phar \
	&& ln -s /usr/local/bin/phpDocumentor.phar /usr/local/bin/phpdoc \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
CMD ["php", "-a"]
