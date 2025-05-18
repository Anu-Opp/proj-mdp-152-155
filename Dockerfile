FROM maven:3.8.1-openjdk-8 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package

FROM tomcat:9.0
COPY --from=build /app/target/app.war /usr/local/tomcat/webapps/

