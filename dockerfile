FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy entire repo (source files)
COPY . .

# Make sure the .git directory exists inside the container
# Lavalink's build.gradle.kts REQUIRES this
COPY .git .git

# Gradle permission
RUN chmod +x ./gradlew

# Build Lavalink
RUN ./gradlew shadowJar

# Move the jar so we know the name
RUN mv build/libs/*-all.jar Lavalink.jar

# Ensure application.yml is copied (overwrite if needed)
COPY application.yml /app/application.yml

EXPOSE 2333

CMD ["java", "-jar", "Lavalink.jar"]
