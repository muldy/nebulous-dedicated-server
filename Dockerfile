from steamcmd/steamcmd:ubuntu-22

VOLUME "/home/steam/neb/DedicatedServerConfig.xml", "/home/steam/neb/NebulousDedicatedServer_Data"

RUN apt update && apt install libxml2-utils -y 

RUN useradd -ms /bin/bash steam

RUN mkdir -p /root/.steam/sdk64/

RUN steamcmd +login anonymous +force_install_dir /home/steam/neb +app_update 2353090 +quit 

RUN rm /home/steam/neb/steamclient.so
RUN ln -s /home/steam/neb/linux64/steamclient.so /home/steam/neb/steamclient.so
RUN chown steam /home/steam -R 
RUN chown steam /home/steam/.* -R 

USER steam
WORKDIR /home/steam/neb

COPY docker-entrypoint.sh /home/steam/neb/

EXPOSE 7777/tcp
EXPOSE 27016/udp

ENTRYPOINT ["/home/steam/neb/docker-entrypoint.sh"]
