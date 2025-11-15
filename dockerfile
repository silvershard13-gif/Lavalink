# Use Java 17 runtime
FROM eclipse-temurin:17-jre

WORKDIR /app

# Download latest Lavalink
ADD https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar lavalink.jar

# Copy your config
COPY application.yml .

# Create plugins directory
RUN mkdir /app/plugins

# Download latest YouTube plugin (1.16.0)
ADD https://repo.lavalink.dev/releases/dev/lavalink/youtube/youtube-plugin/1.16.0/youtube-plugin-1.16.0.jar /app/plugins/

# Expose Lavalink port
EXPOSE 2333

# Start Lavalink
CMD ["java", "-jar", "lavalink.jar"]
