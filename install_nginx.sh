#########################
# PASSOS ANTERIORES
##########################
# Conectar na máquina atraǘes do ssh
1) ssh usuario@192.168.96.181
# Executar script - vai entrar no container 
2)./install_alpine_docker.sh

#########################
# PASSO A PASSO INSTALAÇÃO NGINX
##########################
# Atualização do sistema 
1) apk update
# Instalação nginx
2) apk add nginx

##########################
# Adiciona usuário e grupo 'www'
3) adduser -D -g 'www' www
# Cria pasta www no diretório raiz
4) mkdir /www

##########################
# Define usuário e grupo  proprietário dos diretórios
5) chown -R www:www /var/lib/nginx
6) chown -R www:www /www
# Muda nome de arquivo nginx para não perder config padrão
7) mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

##########################
# Cria arquivo de configuração nginx
8) echo "user                            www;
worker_processes                auto; # it will be determinate automatically by the number of core

error_log                       /var/log/nginx/error.log warn;
#pid                             /var/run/nginx/nginx.pid; # it permit you to use rc-service nginx reload|restart|stop|start

events {
    worker_connections          1024;
}

http {
    include                     /etc/nginx/mime.types;
    default_type                application/octet-stream;
    sendfile                    on;
    access_log                  /var/log/nginx/access.log;
    keepalive_timeout           3000;
    server {
        listen                  80;
        root                    /www;
        index                   index.html index.htm;
        server_name             localhost;
        client_max_body_size    32m;
        error_page              500 502 503 504  /50x.html;
        location = /50x.html {
              root              /var/lib/nginx/html;
        }
    }
}" >> /etc/nginx/nginx.conf

# Cria uma página simples html
9) echo "<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>HTML5</title>
</head>
<body>
    Server is online
</body>
</html>" >> /www/index.html

##########################
# Testa arquivo de configuração nginx
10) nginx -t
# Inicia servidor nginx
11) nginx
