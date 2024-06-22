FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -DskipTests

FROM openjdk:17-jdk-slim
LABEL authors="Boris Djotov 185022"
WORKDIR /app
COPY --from=build /app/target/*.jar e-shop-0.0.1-SNAPSHOT.jar
EXPOSE 9090
ENTRYPOINT ["java","-jar","/app/e-shop-0.0.1-SNAPSHOT.jar"]
