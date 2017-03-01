#!/bin/sh

LaravelInstall()
{
    docker run -it --rm -v $PWD:/app shion/composer create-project --prefer-dist laravel/laravel app "$1"
}

NpmInstall()
{
    docker build node -t nodecn
    docker run -d -v $PWD/app:/app -w /app --name laravel_node nodecn tail -f /dev/null
    docker exec laravel_node cnpm install -g gulp-cli grunt-cli webpack bower
    docker exec laravel_node cnpm install
}

Init()
{
    expr $1 + 0 1>/dev/null 2>&1
    if ([ $? -eq 0 ] && [ $1 -lt 7 ] && [ $1 -gt 0 ]) || [ x$1 == x ]; then
        case $1 in
            1)
                echo "You will install Laravel 5.4"
                LaravelInstall "5.4.*"
                NpmInstall
                ;;
            2)
                echo "You will install Laravel 5.3"
                LaravelInstall "5.3.*"
                NpmInstall
                ;;
            3)
                echo "You will install Laravel 5.2"
                LaravelInstall "5.2.*"
                NpmInstall
                ;;
            4)
                echo "You will install Laravel 5.1"
                LaravelInstall "5.1.*"
                NpmInstall
                ;;
            5)
                echo "You will install Laravel 5.0"
                LaravelInstall "5.0.*"
                NpmInstall
                ;;
            6)
                echo "You will install Laravel 4.2"
                LaravelInstall "4.2.*"
                ;;
            *)
                echo "You will install Laravel 5.4"
                LaravelInstall "5.4.*"
                NpmInstall
                ;;
        esac
        docker-compose up -d
    else
        echo 'Invalid number'
    fi
}

versionInput=1
if [ x$1 == x ]; then
    echo "Please choose an appropriate version:"
    echo "1). 5.4(default)"
    echo "2). 5.3"
    echo "3). 5.2"
    echo "4). 5.1"
    echo "5). 5.0"
    echo "6). 4.2"
    read -p "Enter your choice: " versionInput
    Init $versionInput
else
    while getopts "v:" opt; do
        case $opt in
            v)
                Init $OPTARG
                ;;
            *)
                echo "Invalid option: -$opt"
                ;;
        esac
    done
fi