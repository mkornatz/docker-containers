FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
  apache2 \
  libapache2-mod-php \
  php \
  php-xml \
  php-gd \
  php-mysqlnd \
  php-mbstring \
  php-mcrypt \
  php-curl \
  php-imagick \
  php-mongodb \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# This writes a literal ${APACHE_SERVER_NAME} using single quotes
RUN echo 'ServerName ${APACHE_SERVER_NAME}' >> /etc/apache2/apache2.conf

ADD ./apache2/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod deflate
RUN a2enmod env
RUN a2enmod expires

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/run/apache.lock
ENV APACHE_PID_FILE /var/run/apache.pid
ENV APACHE_SERVER_NAME localhost

VOLUME ["/var/www/html"]

# Sets up a link to have Apache output logs to stdout
RUN ln -sfn /proc/self/fd/1 ${APACHE_LOG_DIR}/access.log && \
    ln -sfn /proc/self/fd/1 ${APACHE_LOG_DIR}/error.log

ADD ./start.sh /start.sh
RUN chmod 755 /*.sh

# Sets up the www-data user with the UID of host user in order to own 
# www directories.
#
# This is useful for something like php writing to /var/www/html/logs
#
# NOTE: This UID and Group are based on boot2docker hosted volumes.
#       You may need to change these based on your configuration.
RUN usermod -u 1000 www-data
RUN usermod -G staff www-data
RUN chown -R www-data:www-data /var/www

CMD ["/bin/bash", "/start.sh"]

EXPOSE 80
