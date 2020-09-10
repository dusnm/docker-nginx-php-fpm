# Dockerized nginx/php-fpm environment

### Basic Dockerfile for PHP projects based on Arch Linux. Further configuration is required to make it usable.

### Building
```shell
docker build -t some_name .
```

### Running
```shell
docker run -p 8080:80 -d some_name
```
