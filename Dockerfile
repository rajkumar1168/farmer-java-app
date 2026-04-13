# Step 1: Build stage
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app
COPY . .  # Copy all files, including App.java
RUN javac App.java

# Step 2: Runtime stage
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/*.class /app/  
EXPOSE 8080
CMD ["java", "App"]

