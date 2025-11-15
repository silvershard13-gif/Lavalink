FROM eclipse-temurin:17-jre

WORKDIR /app

# Download Lavalink
ADD https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar lavalink.jar

# Copy config
COPY application.yml .

# Make plugins folder
RUN mkdir /app/plugins

# Download YouTube plugin (correct URL)
ADD https://maven.lavalink.dev/releases/dev/lavalink/youtube/youtube-plugin/1.16.0/youtube-plugin-1.16.0.jar /app/plugins/youtube-plugin-1.16.0.jar

EXPOSE 2333

CMD ["java", "-jar", "lavalink.jar"]
