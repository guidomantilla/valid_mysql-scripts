PARENT_NAME=$1
if [ -z "$PARENT_NAME" ]; then
    APP_NAME=valid-mysql
else
    APP_NAME="$PARENT_NAME"
fi

PARENT_PORT=$2
if [ -z "$PARENT_PORT" ]; then
    PORT=3308
else
    PORT="$PARENT_PORT"
fi

PARENT_PASSWORD=$3
if [ -z "$PARENT_PASSWORD" ]; then
    PASSWORD="v4l1d-gu1d0-m4nt*"
else
    PASSWORD="$PARENT_PASSWORD"
fi


docker build . -t "$APP_NAME" \
&& docker container rm --force "$APP_NAME" 
   docker container run --detach --restart always \
                        --network valid-network \
                        --env MYSQL_ROOT_PASSWORD="$PASSWORD" \
                        --publish "$PORT":3306 \
                        --name "$APP_NAME" "$APP_NAME"
