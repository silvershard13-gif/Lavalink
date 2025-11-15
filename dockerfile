FROM eclipse-temurin:17-jre
WORKDIR /app

# Download Lavalink
ADD https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar lavalink.jar

COPY application.yml .

EXPOSE 2333

CMD ["java", "-jar", "lavalink.jar"]
