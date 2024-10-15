# Usar la imagen de Maven para compilar la aplicación
FROM maven:3.8.1-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Usar la imagen de Java para ejecutar la aplicación
FROM openjdk:11-jre
WORKDIR /app
COPY --from=build /app/target/cantos-api-1.0.jar /app/cantos-api-1.0.jar
ENTRYPOINT ["java", "-jar", "/app/cantos-api-1.0.jar"]
