# Ubunut 16 + Apache 2 + PHP 7 Docker Container

**Note: This is NOT configured for production use.**

## Environment Variables

- `APACHE_SERVER_NAME` - the hostname to be used for the server
- `APACHE_DOCUMENT_ROOT` - entry point for the php app (e.g. "/var/www/html/public")

## Volumes

- `/var/www/html`
- `/var/log/apache2`

## Ubuntu

Version 16.04

## PHP

Version 7.0.13

To override the default php configuration, mount a local file on top of the php.ini:

```
./php.ini:/etc/php/7.0/apache2/php.ini
```

## Apache

Version 2.4.18

Override the default vhost by mounting your own:

```
./my-vhost.conf:/etc/apache2/sites-available/000-default.conf
```

## Build & Push

```
docker build ./ -t mkornatz/ubuntu16-apache2-php7.0:latest
docker push mkornatz/ubuntu16-apache2-php7.0:latest
```
