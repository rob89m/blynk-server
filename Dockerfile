FROM openjdk:10-jre
MAINTAINER Robert Taylor <rob89m@outlook.com>

ENV BLYNK_SERVER_VERSION 0.39.12
RUN mkdir /data
RUN curl -L https://github.com/blynkkk/blynk-server/releases/download/v${BLYNK_SERVER_VERSION}/server-${BLYNK_SERVER_VERSION}.jar > /data/server.jar

# Create configuration folder. To persist data, map a file to /config/server.properties
RUN touch /data/server.properties
VOLUME ["/data", "/data/backup"]

# IP port listing:
# 8080: Hardware without ssl/tls support
# 9443: Blynk app, https, web sockets, admin port
EXPOSE 8080 9443

WORKDIR /data
#ENTRYPOINT ["java", "-jar", "/data/server.jar", "-dataFolder", "/data", "-serverConfig", "/data/server.properties"]
ENTRYPOINT ["java", "-jar", "/data/server.jar", "-dataFolder", "/data"]
