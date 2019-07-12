# WordPress Docker
WordPress running on Docker, separate DB and app containers

## Usage:
- Copy database dump to `./db`, rename to `*.sql`

- Add to top of SQL dump:
  ```
  SET sql_mode = '';
  ```

- Copy WordPress site to `./site`

- Run script:
  ```
  ./wordpress-docker.sh PUBLIC_IP_OF_HOST
  ```

- Navigate to http://localhost
