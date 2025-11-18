FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy source code
COPY . .

# Create a fake .git directory so JGit does not crash
RUN mkdir -p .git && \
    echo "ref: refs/heads/main" > .git/HEAD && \
    mkdir -p .git/refs/heads && \
    echo "0000000000000000000000000000000000000000" > .git/refs/heads/main

# Gradle permission
RUN chmod +x ./gradlew

# Build Lavalink
RUN ./gradlew shadowJar --no-daemon

# Move output jar
RUN mv build/libs/*-all.jar Lavalink.jar

# Copy config
COPY application.yml /app/application.yml

EXPOSE 2333

CMD ["java", "-jar", "Lavalink.jar"]
