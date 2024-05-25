# aun no hay version de docker estable para Ubuntu 23.10 ni para 24.04, asi que usamos
# la version Jammy Jellyfish, 22.04
FROM ubuntu:jammy

USER root
ENTRYPOINT ["dockerd"]

# script para la instalacion de docker
WORKDIR /root
COPY script_instalacion_docker.sh .
RUN chmod u+x script_instalacion_docker.sh
RUN sh -c ./script_instalacion_docker.sh

# el archivo de configuracion del comportamiento de docker, usando docker compose este 
# archivo se sobreescribe, y se aplica la configuracion que el usuario especifique
COPY daemon.json /etc/docker/daemon.json
