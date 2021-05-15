FROM ubuntu:focal
ENV TERM=linux
RUN echo "debconf debconf/frontend select Noninteractive" \
		| debconf-set-selections; \
	apt-get update \
	&& apt-get install -y software-properties-common \
	&& add-apt-repository ppa:ondrej/php \
	&& apt-get update \
	&& apt-get -y --no-install-recommends install \
	ca-certificates \
	curl \
	git \
	graphviz \
	php8.0-apcu \
	php8.0-cli \
	php8.0-curl \
	php8.0-fpm \
	php8.0-gd \
	php8.0-igbinary \
	php8.0-imap \
	php8.0-intl \
	php8.0-mbstring \
	php8.0-memcached \
	php8.0-msgpack \
	php8.0-mysql \
	php8.0-opcache \
	php8.0-readline \
	php8.0-redis \
	php8.0-xdebug \
	php8.0-xml \
	php8.0-yaml \
	php8.0-zip \
	unzip \
	&& apt-get clean \
	&& echo "xdebug.mode=coverage" >> /etc/php/8.0/cli/conf.d/20-xdebug.ini \
	&& curl -sS https://getcomposer.org/composer-2.phar -o /usr/local/bin/composer \
	&& chmod +x /usr/local/bin/composer \
	&& curl -sSL https://gitlab.com/natanfelles/phpdoc/-/raw/master/phpDocumentor.phar -o /usr/local/bin/phpdoc \
	&& chmod +x /usr/local/bin/phpdoc \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
CMD ["php", "-a"]
