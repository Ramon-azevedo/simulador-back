# Etapa de construção
FROM maven:3.8.4-openjdk-17-slim AS build

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o código fonte e o arquivo pom.xml para o contêiner
COPY . .

# Executa o Maven para construir o projeto e criar o JAR
RUN ./mvnw clean install -DskipTests

# Etapa de execução (rodando o JAR)
FROM openjdk:17-jdk-slim

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o JAR gerado pela etapa de construção para a etapa de execução
COPY --from=build /app/target/simulador-back-0.0.1-SNAPSHOT.jar /app/app.jar

# Expondo a porta 8080
EXPOSE 8080

# Comando para executar o aplicativo
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
