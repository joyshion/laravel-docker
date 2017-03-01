# laravel-docker
[![Build Status](https://travis-ci.org/joyshion/laravel-docker.svg?branch=master)](https://travis-ci.org/joyshion/laravel-docker)

[English](https://github.com/joyshion/laravel-docker/blob/master/README.md "English") [简体中文](https://github.com/joyshion/laravel-docker/blob/master/README_CN.md "简体中文")

基于docker容器的Laravel运行环境（支持Laravel多版本）

###包含软件
- PHP 7.1
- Nginx
- MariaDB
- Composer
- Node (With Bower, Grunt, Gulp and Webpack)
- Redis
- Memcached

###安装
```sh
chmod +x install.sh
./install.sh
```
如果在中国使用，请使用如下方法：
```sh
chmod +x install_cn.sh
./install_cn.sh
```
###前端构建
```sh
# Mix
docker run -it --rm -v $PWD/app:/app -w /app node:alpine npm run watch
docker run -it --rm -v $PWD/app:/app -w /app node:alpine npm run production
# Elixir
docker run -it --rm -v $PWD/app:/app -w /app node:alpine gulp watch
docker run -it --rm -v $PWD/app:/app -w /app node:alpine gulp --production
```
###扩展包
```sh
docker run -it --rm -v $PWD:/app composer require shion/aliyun-oss
```
###Artisan
```sh
docker-compose ps
docker exec PHP_CONTAINER_NAME php artisan list
```