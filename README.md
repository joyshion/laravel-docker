# laravel-docker
[![Build Status](https://travis-ci.org/joyshion/laravel-docker.svg?branch=master)](https://travis-ci.org/joyshion/laravel-docker)

[English](https://github.com/joyshion/laravel-docker/blob/master/README.md "English") [简体中文](https://github.com/joyshion/laravel-docker/blob/master/README_CN.md "简体中文")

Laravel environment based on the docker container (Support Laravel multiple versions)

###Included Software
- PHP 7.1
- Nginx
- MariaDB
- Composer
- Node (With Bower, Grunt, Gulp and Webpack)
- Redis
- Memcached

###Installation
```sh
chmod +x install.sh
./install.sh
```
If used in China:
```sh
chmod +x install_cn.sh
./install_cn.sh
```

###Frontend
```sh
# Mix
docker exec laravel_node npm run watch
docker exec laravel_node npm run production
# Elixir
docker exec laravel_node gulp watch
docker exec laravel_node gulp --production
```
###Package
```sh
docker run -it --rm -v $PWD:/app composer require shion/aliyun-oss
```
###Artisan
```sh
docker-compose ps
docker exec PHP_CONTAINER_NAME php artisan list
```