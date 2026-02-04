FROM maven:3.9.3-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests

FROM tomcat:9.0.115-jdk17-corretto

EXPOSE 8080

COPY --from=build /app/target/JavaLoginShowcase-1.0.0.war \
/usr/local/tomcat/webapps/JavaLoginShowcase.war

CMD ["catalina.sh", "run"]
