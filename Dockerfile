from maven:latest AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
COPY --from=build /app/target/*.jar lab2.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "lab2.jar"]