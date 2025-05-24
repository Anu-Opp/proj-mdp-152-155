# Stage 1: Build
FROM maven:3.8.1-openjdk-8 AS build
WORKDIR /app
COPY src /app
COPY pom.xml /app
RUN mvn clean package

# Stage 2: Deploy the WAR on Tomcat
FROM tomcat:9.0
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
