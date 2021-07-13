export CONTAINER_NAME="$(docker ps -aqf "ancestor=aidoop/aidoop-p" | head -1)"
docker exec -it $CONTAINER_NAME npm run migration -- --mode=production