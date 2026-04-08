# Step 1: Build stage
FROM openjdk:17-jdk-slim AS build
WORKDIR /app
COPY . .  # Copy all files, including App.java
RUN javac App.java

# Step 2: Runtime stage
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/*.class /app/  
EXPOSE 8080
CMD ["java", "App"]

