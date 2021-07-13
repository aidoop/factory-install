@ECHO OFF
echo "installing..."
IF EXIST config.production.js (
  echo "config.production.js exist"
) ELSE (
  echo "config.production.js create"
  curl -O https://raw.githubusercontent.com/aidoop/factory/master/packages/aidoop-p/installer/config.production.js
)

IF EXIST .env (
  echo ".env exist"
) ELSE (
  echo ".env create"
  curl -O https://raw.githubusercontent.com/aidoop/factory/master/packages/aidoop-p/installer/.env
)

IF EXIST docker-compose.yml (
  echo "docker-compose.yml exist"
) ELSE (
  echo "docker-compose.yml create"
  curl -O https://raw.githubusercontent.com/aidoop/factory/master/packages/aidoop-p/installer/docker-compose.yml
)

docker pull aidoop/postgres-fd
docker pull aidoop/aidoop-fd

docker-compose up -d
