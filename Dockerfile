FROM eclipse-temurin:17-jre

WORKDIR /app

# Download latest Lavalink release during build
RUN apt-get update && apt-get install -y wget && \
    wget -O lavalink.jar https://github.com/lavalink-devs/Lavalink/releases/download/4.0.5/Lavalink.jar

# Copy your config
COPY application.yml /app/application.yml

EXPOSE 2333

CMD ["java", "-Xmx512m", "-jar", "lavalink.jar"]
