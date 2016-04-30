docker pull mariadb
docker pull drupal:8.0.0
docker run -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=drupal8 -e MYSQL_USER=drupal8 -e MYSQL_PASSWORD=hist985E2 -v mariadb:/var/lib/mysql -d --name mariadb mariadb --restart=always
docker run --name drupal8 --link mariadb:mysql -p 80:80 -d drupal:8.0.0 --restart=always