FROM eclipse-temurin:17-jre

WORKDIR /app

# Download Lavalink v3.7.8 (latest stable v3)
ADD https://github.com/lavalink-devs/Lavalink/releases/download/3.7.8/Lavalink.jar lavalink.jar

# Install system dependencies for Python + yt-dlp
RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip \
    ffmpeg \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Create virtual environment for Python packages
RUN python3 -m venv /opt/venv

# Install yt-dlp in the virtual environment
RUN /opt/venv/bin/pip install --upgrade pip yt-dlp

# Add venv to PATH so yt-dlp can be used system-wide
ENV PATH="/opt/venv/bin:$PATH"

# Copy config
COPY application.yml .

EXPOSE 2333

CMD ["java", "-jar", "lavalink.jar"]
