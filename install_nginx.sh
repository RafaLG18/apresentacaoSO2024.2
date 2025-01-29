#########################
# PASSOS ANTERIORES
##########################

#####################################
# Obs.: Executar somente essa parte somente se for para se conectar a minha máquina virtual.
###################################
# Conectar na máquina atraǘes do ssh
1) ssh usuario@192.168.96.181
# Executar script - vai entrar no container 
2)./run_alpine_docker.sh

#####################################
# Obs.: Se estiver executando na máquina local, executar o seguinte comando
###################################
# Levantar docker com imagem alpine, expõe a porta 8080 da maquina local e container, e entra no container
1) docker run -it alpine:latest --name alpine sh

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
8) 	
	8.0) apk add neovim
	8.1) Ir para o a planilha e clicar no link "Arquivo" 
	8.2) nvim /etc/nginx/nginx.conf
	8.3) Para colar "ctrl" + "shift" + "v"
	8.4) Para sair "esc" + ":x!"

# Cria uma página simples html
9) 
	9.1) Ir para o a planilha e clicar no link "arquivo html"
	9.2) nvim /www/index.html
	9.3) Para colar "ctrl" + "shift" + "v"
	9.4) Para sair "esc" + ":x!"

##########################
# Testa arquivo de configuração nginx
10) nginx -t
# Inicia servidor nginx
11) nginx
