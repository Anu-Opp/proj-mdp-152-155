# Stage 1: Build the WAR file using Maven
FROM maven:3.8.1-openjdk-8 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Deploy the WAR on Tomcat
FROM tomcat:9.0
COPY --from=build /app/target/WebAppCal-1.3.5.war /usr/local/tomcat/webapps/app.war
