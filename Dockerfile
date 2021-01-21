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
	&& curl -sS https://getcomposer.org/composer-2.phar -o composer \
	&& chmod +x composer \
	&& mv composer /usr/local/bin/composer \
	&& curl -sSL https://github.com/phpDocumentor/phpDocumentor/releases/download/v3.0.0/phpDocumentor.phar -o /usr/local/bin/phpDocumentor.phar \
	&& curl -sSL https://github.com/phpDocumentor/phpDocumentor/releases/download/v3.0.0/phpDocumentor.phar.asc -o /usr/local/bin/phpDocumentor.phar.asc \
	&& chmod +x /usr/local/bin/phpDocumentor.phar \
	&& ln -s /usr/local/bin/phpDocumentor.phar /usr/local/bin/phpdoc \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
CMD ["php", "-a"]
