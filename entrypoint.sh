#!/bin/bash
sleep 2

cd /home/container

# Update Server
if [ "${SERVER_AUTOUPDATE}" == "1" ]; then
    ./steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/container +app_update 619960 +quit
fi

# Replace Startup Variables
MODIFIED_STARTUP=$(eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
