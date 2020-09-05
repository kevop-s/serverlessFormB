#!/bin/bash
######################################
#                                    #
#        Serverless Form Front       #
#                                    #
######################################

SERVERLESSB_CONTAINER="serverles-back"
SERVERLESSB_BACK_PORT="4444"
SERVERLESSB_SMTP_PORT="465"
SERVERLESSB_SMTP_HOST="smtp.gmail.com"
SERVERLESSB_SMTP_USER="kevops97@gmail.com"
SERVERLESSB_SMTP_PASS="thyqmjgwjvwimhlo"
SERVERLESSB_SMTP_SERVICE="Gmail"

docker run -itd --name $SERVERLESSB_CONTAINER \
    -p $SERVERLESSB_BACK_PORT:$SERVERLESSB_BACK_PORT \
    -v /etc/localtime:/etc/localtime:ro \
    -v /usr/share/zoneinfo:/usr/share/zoneinfo:ro \
    -e BACK_PORT=$SERVERLESSB_BACK_PORT \
    -e SMTP_PORT=$SERVERLESSB_SMTP_PORT \
    -e SMTP_HOST=$SERVERLESSB_SMTP_HOST \
    -e SMTP_USER=$SERVERLESSB_SMTP_USER \
    -e SMTP_PASS=$SERVERLESSB_SMTP_PASS \
    -e SMTP_SERVICE=$SERVERLESSB_SMTP_SERVICE \
    -e TZ=America/Mexico_City \
    serverlessformb