FROM eclipse-temurin:17-jre

WORKDIR /app

# download lavalink jar automatically
RUN apt-get update && apt-get install -y wget \
    && wget https://github.com/lavalink-devs/Lavalink/releases/download/4.0.5/Lavalink.jar

COPY application.yml .

EXPOSE 2333

CMD ["java", "-jar", "Lavalink.jar"]
