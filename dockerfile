# Lavalink requires Java 17+
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy the entire source code from your repo
COPY . .

# Give Gradle permission to run
RUN chmod +x ./gradlew

# Build Lavalink with Gradle (shadowJar creates the runnable jar)
RUN ./gradlew shadowJar

# Move the jar to a predictable name
RUN mv build/libs/*-all.jar Lavalink.jar

# Copy application.yml — overwrite if needed
COPY application.yml /app/application.yml

# Expose default (Render uses PORT env anyway)
EXPOSE 2333

# Start Lavalink
CMD ["java", "-jar", "Lavalink.jar"]
