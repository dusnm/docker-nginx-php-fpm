FROM archlinux:latest

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm nginx php php-fpm php-sqlite php-pgsql php-mongodb php-redis php-igbinary php-gd php-imap php-sodium composer unzip
RUN mkdir /etc/nginx/sites-available
RUN mkdir /etc/nginx/sites-enabled

COPY ./enable_php_extensions.sh /root/

RUN ./root/enable_php_extensions.sh

COPY ./nginx.conf /etc/nginx/
COPY ./project.conf /etc/nginx/sites-available/
COPY ./project /usr/share/nginx/project/

RUN ln -s /etc/nginx/sites-available/project.conf /etc/nginx/sites-enabled/project.conf
RUN chown -R http:http /usr/share/nginx/project

EXPOSE 80

STOPSIGNAL SIGTERM

CMD php-fpm -R -D; nginx -g "daemon off;";
