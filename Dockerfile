FROM debian:buster
ENV TERM=linux
RUN echo "debconf debconf/frontend select Noninteractive" | debconf-set-selections; \
	apt-get update \
	&& apt-get -yqq --no-install-recommends install \
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
	sudo \
	&& apt-get clean \
	&& curl -sS https://getcomposer.org/installer \
	| php -- --install-dir=/usr/local/bin --filename=composer \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*; \
	useradd -rm -d /home/username -s /bin/bash -g root -G sudo -u 1000 username
USER username
WORKDIR /home/username
CMD ["php", "-a"]
