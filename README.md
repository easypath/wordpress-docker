# wordpress-docker
WordPress running on Docker, separate DB, NGINX and PHP7-FPM containers

-Clone latest WordPress Docker: 
`git clone https://github.com/easypath/wordpress-docker.git <domain_name> && rm -rf <domain_name>/.git`

-Make install script executable:
`chmod +x wordpress-docker.sh`

-Optional: change database details in script

-Optional: edit docker-compose.yaml, update "nginx" HTTP port

-Run script:
`./wordpress-docker.sh`

-Navigate to http://localhost:8080, complete initial WordPress setup

-Refer to WordPress Standards, Install & Operations for additional setup

-Optional: connect phpMyAdmin Docker image to DB container:
  - Get network by running `docker network ls`
  - `docker run --name phpmyadmin -d —network=<network> -p 8081:80 phpmyadmin/phpmyadmin`
