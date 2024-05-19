FROM maven:3.8.4-openjdk-21 AS build
# Copy the source code to the Docker image
COPY . .
RUN mvn clean package


# Use the OpenJDK 21 image
FROM openjdk:21-jdk-alpine
# Create a volume to store temporary files
VOLUME /tmp
# Copy the built JAR file from the target directory to the Docker image
COPY target/*.jar app.jar
EXPOSE 8080
# Define the entry point to run the application
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
