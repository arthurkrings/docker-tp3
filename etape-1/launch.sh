docker pull nginx:latest
docker pull php:8.2-fpm
docker network create TP3
docker container run -d --name HTTP --network TP3 -p 8080:80 -v /root/docker-tp3/etape-1/index.php:/app/index.php nginx:latest
docker container run -d --name SCRIPT --network TP3 -v /root/docker-tp3/etape-1/index.php:/app/index.php php:8.2-fpm
docker cp HTTP:/etc/nginx/conf.d/default.conf /root/default.conf #extraire le fichier default.conf du conteneur pour y mettre la nouvelle conf
docker cp ./default.conf HTTP:/etc/nginx/conf.d/default.conf #remettre le fichier de configuration dans le conteneur
docker exec -it HTTP /bin/bash
nginx -s reload
curl localhost:8080/index.php
