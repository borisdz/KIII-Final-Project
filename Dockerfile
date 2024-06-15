FROM maven:4.0.0-alpha-13 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:17-jdk
LABEL authors="Boris Djotov 185022"
WORKDIR /app
COPY target/*.jar /app/e-shop-0.0.1-SNAPSHOT.jar
EXPOSE 9090
ENTRYPOINT ["java","-jar","/app/e-shop-0.0.1-SNAPSHOT.jar"]