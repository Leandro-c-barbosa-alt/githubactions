# Use a imagem oficial do Ubuntu como base
FROM ubuntu:latest

# Evita que algumas interações sejam solicitadas durante a instalação de pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Realiza as atualizações e instalações requeridas
RUN apt-get clean -y && \
    apt-get update -y && \
    apt --only-upgrade install -y zip && \
    apt --only-upgrade install -y curl && \
    apt --only-upgrade install -y wget && \
    apt install openjdk-8-jdk -y && \
    apt --only-upgrade install -y jq && \
    apt --only-upgrade install -y grep && \
    apt autoremove -y

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos locais para o container
#COPY . .

# Define o comando padrão para rodar quando iniciar o container
CMD ["bash"]
