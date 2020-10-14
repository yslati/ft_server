FROM debian

RUN apt-get update -y && \
	apt-get install -y wget gnupg lsb-release nginx curl vim expect && \
	apt-get update && apt-get upgrade -y
RUN	apt install php-fpm php-mysql -y && \
	apt install php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -y

RUN rm -rf /etc/nginx/sites-enabled/* && rm -rf /etc/nginx/sites-available/*
ADD ./srcs/mydata.sql /mydata.sql
ADD ./srcs/default /etc/nginx/sites-available/default
ADD ./srcs/ssl_info.sh /ssl_info.sh
ADD ./srcs/script.sh /script.sh
ADD ./srcs/ssl-params.conf /etc/nginx/snippets/ssl-params.conf
ADD ./srcs/self-signed.conf /etc/nginx/snippets/self-signed.conf
RUN chmod +x /script.sh && chmod +x /ssl_info.sh

RUN cd /tmp && wget https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb && \
	printf '1\n1\n4\n' | dpkg -i mysql-apt*

RUN printf 'y\n4\n' | apt upgrade && apt update

RUN DEBIAN_FRONTEND=noninteractive apt install mysql-server -y && \
	chown -R mysql:mysql /var/lib/mysql && service mysql start && mysql -u root < mydata.sql

RUN	service php7.3-fpm start

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

RUN	cd /tmp && wget https://wordpress.org/latest.tar.gz
RUN mkdir /var/www/html/wordpress && tar xzf /tmp/latest.tar.gz --strip-components=1 -C /var/www/html/wordpress

ADD ./srcs/wp-config.php /var/www/html/wordpress/wp-config.php
RUN chown -R www-data:www-data /var/www/html/wordpress
RUN ./ssl_info.sh && openssl dhparam -out /etc/nginx/dhparam.pem 4096

RUN apt update && \
	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
RUN	gpg --keyserver hkps://hkps.pool.sks-keyservers.net --recv-keys 3D06A59ECE730EB71B511C17CE752F178259BD92
RUN	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz.asc && \
	sha256sum phpMyAdmin-4.9.0.1-english.tar.gz
RUN	mkdir /var/www/html/phpmyadmin && \
	tar xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin
ADD ./srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
RUN	chmod 660 /var/www/html/phpmyadmin/config.inc.php && \
	chown -R www-data:www-data /var/www/html/phpmyadmin
RUN nginx -t && service nginx restart

EXPOSE 443 80

ENTRYPOINT ./script.sh