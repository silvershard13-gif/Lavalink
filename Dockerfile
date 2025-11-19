FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy Lavalink jar (rename accordingly)
COPY Lavalink.jar /app/Lavalink.jar
COPY application.yml /app/application.yml

EXPOSE 2333

CMD ["java", "-Xmx512m", "-jar", "Lavalink.jar"]
