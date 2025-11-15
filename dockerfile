FROM eclipse-temurin:17-jre
WORKDIR /app

# Download Lavalink JAR
ADD https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar lavalink.jar

COPY application.yml .

# Create plugins directory
RUN mkdir /app/plugins

# Download YouTube plugin
ADD https://maven.lavalink.dev/releases/dev/lavalink/youtube/youtube-plugin/1.8.0/youtube-plugin-1.8.0.jar /app/plugins/

EXPOSE 2333

CMD ["java", "-jar", "lavalink.jar"]
