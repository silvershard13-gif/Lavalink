FROM eclipse-temurin:17-jre

WORKDIR /app

# Download Lavalink v3.7.8 (latest stable v3)
ADD https://github.com/lavalink-devs/Lavalink/releases/download/3.7.8/Lavalink.jar lavalink.jar

# Install yt-dlp (required for YouTube)
RUN apt-get update && apt-get install -y python3 python3-pip && pip3 install yt-dlp

# Copy config
COPY application.yml .

EXPOSE 2333

CMD ["java", "-jar", "lavalink.jar"]
