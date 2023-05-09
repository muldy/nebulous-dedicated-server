from steamcmd/steamcmd:ubuntu-22

WORKDIR /home/steam/neb

#CMD ["steamcmd","+login","anonymous","+force_install_dir","/home/steam/neb","+app_update","2353090","+quit"]
RUN steamcmd +login anonymous +force_install_dir /home/steam/neb +app_update 2353090 +quit 
#RUN ls -la /home/steam/neb


COPY docker-entrypoint.sh /home/steam/neb/

ENTRYPOINT ["/home/steam/neb/docker-entrypoint.sh"]

