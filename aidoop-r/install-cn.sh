if [ -f "config.production.js" ] ; then
  echo "config.production.js exist"
else
  echo "config.production.js create"
  curl -O https://raw.githubusercontent.com/aidoop/factory-install/master/aidoop-r/config.production.js
fi

if [ -f "start.sh" ] ; then
  echo "start.sh exist"
else
  echo "start.sh create"
  curl -O https://raw.githubusercontent.com/aidoop/factory-install/master/aidoop-r/start.sh
fi

if [ -f "stop.sh" ] ; then
  echo "stop.sh exist"
else
  echo "stop.sh create"
  curl -O https://raw.githubusercontent.com/aidoop/factory-install/master/aidoop-r/stop.sh
fi

if [ -f "upgrade.sh" ] ; then
  echo "upgrade.sh exist"
else
  echo "upgrade.sh create"
  curl -O https://raw.githubusercontent.com/aidoop/factory-install/master/aidoop-r/upgrade-cn.sh
fi

if [ -f "migrate.sh" ] ; then
  echo "migrate.sh exist"
else
  echo "migrate.sh create"
  curl -O https://raw.githubusercontent.com/aidoop/factory-install/master/aidoop-r/migrate.sh
fi

if [ -f "docker-compose.yml" ] ; then
  echo "docker-compose.yml exist"
else
  echo "docker-compose.yml create"
  curl -O https://raw.githubusercontent.com/aidoop/factory-install/master/aidoop-r/cn/docker-compose.yml
fi

if [ -f "license.json" ] ; then
  echo "license.json exist"
else
  echo "license.json create"
  curl -O https://raw.githubusercontent.com/aidoop/factory-install/master/aidoop-r/license.json
fi

if [ -f "tsconfig-base.json" ] ; then
  echo "tsconfig-base.json exist"
else
  echo "tsconfig-base.json create"
  curl -O https://raw.githubusercontent.com/aidoop/factory-install/master/aidoop-r/tsconfig-base.json
fi

chmod u+x start.sh
chmod u+x stop.sh
chmod u+x upgrade-cn.sh
chmod u+x migrate.sh

echo "HostPort=3000" > .env

docker pull aidoop/aidoop-r:latest-cn

docker pull hatiolab/operato-nginx:latest

docker-compose create