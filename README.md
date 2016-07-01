# Sickrage for Docker on Raspberry PI

Dockerfile to set up a SickRate container, based on the Hypriot image

## Run

    docker run -d \
        -p 8081:8081 \
        -v /your/localfolder/with/media:/data \
        -v /your/localfolder/to/store/configs:/config \
        --restart=always \
        --name sickrage \
        yuriteixeira/rpi-sickrage


