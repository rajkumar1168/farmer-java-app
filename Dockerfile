# Build + runtime in one image (simple Java app)
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy ONLY the Java file (safe and explicit)
COPY App.java .

# Compile
RUN javac App.java

EXPOSE 8080

# Run the app
CMD ["java", "App"]
