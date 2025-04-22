# Etapa 1: Usar a imagem base
FROM openjdk:21-jdk-slim


# Etapa 2: Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Etapa 3: Copiar os arquivos do projeto para dentro do contêiner
COPY . .

# Etapa 4: Dar permissão para executar o mvnw
RUN chmod +x mvnw

# Etapa 5: Executar o Maven para construir o projeto e criar o JAR
RUN ./mvnw clean install -DskipTests

# Etapa 6: Expor a porta que o Spring Boot usará
EXPOSE 8080

# Etapa 7: Definir o comando para rodar a aplicação
CMD ["java", "-jar", "target/*.jar"]

