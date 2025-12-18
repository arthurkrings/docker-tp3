docker pull mariadb:latest
docker container run -d --name DATA --network TP3 -v /root/docker-tp3/etape-2/create.sql:/docker-entrypoint-initdb.d/create.sql -e MARIADB_RANDOM_ROOT_PASSWORD=yes -e MARIADB_DATABASE=data -e MARIADB_USER=monuser -e MARIADB_PASSWORD=password mariadb:latest
docker build -t php-mysqli .
docker container stop SCRIPT
docker container rm SCRIPT
docker container run -d --name SCRIPT --network TP3 php-mysqli:latest
docker cp ./index.php SCRIPT:/var/www/html
docker cp ./test.php SCRIPT:/var/www/html
docker exec -it SCRIPT /bin/bash
mkdir /app
cp index.php
cp test.php
curl localhost:8080/test.php
