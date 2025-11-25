# syntax=docker/dockerfile:1 
FROM maven AS build 
WORKDIR /app 
COPY . . 
RUN mvn package 

FROM tomcat 
COPY --from=build /app/target/MyFirstJavaWebApp.war /usr/local/tomcat/webapps 