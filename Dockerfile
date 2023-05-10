from steamcmd/steamcmd:ubuntu-22

#VOLUME /home/steam/neb/DedicatedServerConfig.xml
VOLUME /home/steam/neb/NebulousDedicatedServer_Data

RUN useradd -ms /bin/bash steam

RUN mkdir -p /root/.steam/sdk64/
COPY steamclient.so /home/steam/.steam/sdk64/steamclient.so 
COPY steamclient.so /root/.steam/sdk64/steamclient.so 
COPY steamclient.so /home/steam/neb/steamclient.so 

RUN steamcmd +login anonymous +force_install_dir /home/steam/neb +app_update 2353090 +quit 
RUN chown steam /home/steam -R 
RUN chown steam /home/steam/.* -R 
RUN chown steam /home/steam/.steam/sdk64/steamclient.so 
RUN chown steam /home/steam/neb/steamclient.so 
RUN chown steam /root/.steam/sdk64/steamclient.so 
RUN chown steam /root/.steam/sdk64/
RUN chown steam /root/.steam/
RUN chown steam /root/

#RUN mv /home/steam/neb/DedicatedServerConfig.xml /home/steam/neb/DedicatedServerConfig_sample.xml

USER steam
WORKDIR /home/steam/neb

COPY docker-entrypoint.sh /home/steam/neb/

EXPOSE 7777/tcp
EXPOSE 27016/udp
ENTRYPOINT ["/home/steam/neb/docker-entrypoint.sh"]

