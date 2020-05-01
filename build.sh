PARENT_NAME=$1
if [ -z "$PARENT_NAME" ]; then
    APP_NAME=valid_mysql
else
    APP_NAME="$PARENT_NAME"
fi

PARENT_PORT=$2
if [ -z "$PARENT_PORT" ]; then
    PORT=3306
else
    PORT="$PARENT_PORT"
fi


docker build . -t "$APP_NAME" \
&& docker container rm --force "$APP_NAME" 
   docker container run --detach --restart always \
                        --network valid_network \
                        --publish "$PORT":3306 \
                        --name "$APP_NAME" "$APP_NAME"
