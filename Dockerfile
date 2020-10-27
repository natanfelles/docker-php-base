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
	php7.4-apcu \
	php7.4-cli \
	php7.4-curl \
	php7.4-fpm \
	php7.4-gd \
	php7.4-igbinary \
	php7.4-imap \
	php7.4-intl \
	php7.4-json \
	php7.4-mbstring \
	php7.4-memcached \
	php7.4-msgpack \
	php7.4-mysql \
	php7.4-opcache \
	php7.4-readline \
	php7.4-redis \
	php7.4-xdebug \
	php7.4-xml \
	php7.4-yaml \
	php7.4-zip \
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
