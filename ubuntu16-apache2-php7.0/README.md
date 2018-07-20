# Ubunut 16 + Apache 2 + PHP 7 Docker Container

**Note: This is NOT configured for production use.**

This container is meant for non-production environments.

## Environment Variables

- `APACHE_DOCUMENT_ROOT` - entry point for the php app (e.g. "/var/www/html/public")

## Volumes Defined

- `/var/www/html`
- `/var/log/apache2`

## Stack

- Ubuntu 16.04
- Apache 2.4.18
- PHP 7.0.13

To override the default php configuration, mount a local file on top of the php.ini:

```
./php.ini:/etc/php/7.0/apache2/php.ini
```

## Apache Config

Override the default vhost by mounting your own:

```yaml
volumes:
  - ./my-vhost.conf:/etc/apache2/sites-available/000-default.conf
```

## Build & Push

```
docker build ./ -t mkornatz/ubuntu16-apache2-php7.0:latest
docker push mkornatz/ubuntu16-apache2-php7.0:latest
```
