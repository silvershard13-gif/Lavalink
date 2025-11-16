FROM eclipse-temurin:17-jre

WORKDIR /app

# Download Lavalink v4
ADD https://github.com/lavalink-devs/Lavalink/releases/download/4.0.0/Lavalink.jar lavalink.jar

# Copy config
COPY application.yml .

# Create plugins directory
RUN mkdir /app/plugins

# Download YouTube plugin
ADD https://maven.lavalink.dev/releases/dev/lavalink/youtube/youtube-plugin/1.16.0/youtube-plugin-1.16.0.jar /app/plugins/youtube-plugin.jar

EXPOSE 2333

CMD ["java", "-jar", "lavalink.jar"]
