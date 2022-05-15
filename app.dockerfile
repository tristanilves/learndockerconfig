FROM ubuntu:latest

    RUN apt-get update && apt-get upgrade -y && apt-get install curl -y
    RUN apt-get install sudo && apt-get install nano
    RUN DEBIAN_FRONTEND=noninteractive apt-get install apache2 -y \
                 ghostscript \
                 libapache2-mod-php \
                 php \
                 php-mysql \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-xml \
                 php-zip              
    RUN sudo mkdir -p /srv/www && sudo chown www-data: /srv/www
    RUN curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www 

    COPY ./entrypoint.sh entrypoint.sh
    COPY ./wp-config.php srv/www/wordpress
    ENTRYPOINT ["./entrypoint.sh"]




