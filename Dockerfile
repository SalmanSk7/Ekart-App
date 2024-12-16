FROM maven:3.3.9-jdk-8 AS build
COPY . /home
WORKDIR /home
RUN mvn clean package 

FROM openjdk:8-jdk-alpine
COPY --from=build /home/target/shopping-cart-0.0.1-SNAPSHOT.jar /home/shopping-cart-0.0.1-SNAPSHOT.jar
WORKDIR /home
ENTRYPOINT [ "java", "-jar", "shopping-cart-0.0.1-SNAPSHOT.jar" ]