# Use a lightweight OpenJDK 17 base image
FROM eclipse-temurin:17-jre

WORKDIR /app

# Download Lavalink v4.1.1
ADD https://github.com/lavalink-devs/Lavalink/releases/download/4.1.1/Lavalink.jar lavalink.jar

# Install dependencies for yt-dlp in a virtual environment
RUN apt-get update && apt-get install -y \
    python3-venv \
    python3-pip \
    ffmpeg \
    && python3 -m venv /opt/yt-dlp-venv \
    && /opt/yt-dlp-venv/bin/pip install --upgrade pip yt-dlp \
    && ln -s /opt/yt-dlp-venv/bin/yt-dlp /usr/local/bin/yt-dlp \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy Lavalink configuration
COPY application.yml .

# Expose Lavalink default port
EXPOSE 2333

# Start Lavalink
CMD ["java", "-jar", "lavalink.jar"]
