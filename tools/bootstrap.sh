#install docker
sudo apt-get update
sudo apt-get install -y curl
sudo curl -sSL https://get.docker.com/ | sh
#pull 1c servers image
docker pull altf13/1c_server
#pull and run posrtres container. password: **
docker run -d -p 5432:5432 --restart=always -v /volume1/docker/1c/pg_sql:/var/lib/postgresql/data -e POSTGRES_PASSWORD=** --name 1c_postgres temrdm/1c_postgres:9.2-1C
#run 1c server
docker run -d --name 1c_server -v /volume1/docker/1c/data:/root/.1cv8 -v /volume1/docker/1c/apache2:/etc/apache2/ -v /volume1/docker/1c/html:/var/www/html -p 4010:80 -p 1540-1541:1540-1541 -p 1560-1591:1560-1591 -h db altf13/1c_server