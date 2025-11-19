FROM eclipse-temurin:17

WORKDIR /app

# Download Lavalink 4 jar automatically
ADD https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar /app/lavalink.jar

# Copy your config
COPY application.yml /app/application.yml

EXPOSE 2333

CMD ["java", "-Xmx512m", "-jar", "lavalink.jar"]
