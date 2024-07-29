# Create a wordpress pod to show what it looks like in the overview
podman pod create -n wordpress -p 8080:80
podman volume create mysql-volume
podman volume create wordpress-volume
podman run --pod wordpress --name wp.db -e MYSQL_USER=dbuser -e MYSQL_PASSWORD=redhatdemopassword -e MYSQL_DATABASE=wpdb -e MYSQL_ROOT_PASSWORD=redhatdemopassword -v mysql-volume:/var/lib/mysql -d docker.io/library/mariadb:latest
podman run --pod wordpress --name wp.wp -e WORDPRESS_DB_HOST=127.0.0.1 -e WORDPRESS_DB_USER=dbuser -e WORDPRESS_DB_PASSWORD=redhatdemopassword -e WORDPRESS_DB_NAME=wpdb -d -v wordpress-volume:/var/www/html docker.io/library/wordpress
