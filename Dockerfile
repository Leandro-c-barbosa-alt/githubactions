# Use a imagem oficial do Ubuntu como base
FROM ubuntu:latest

# Evita que algumas interações sejam solicitadas durante a instalação de pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Realiza as atualizações e instalações requeridas
RUN apt-get clean -y && \
    apt-get update -y && \
    apt install -y zip && \
    apt install -y curl && \
    apt install -y wget && \
    apt install openjdk-8-jdk -y && \
    apt install -y jq && \
    apt install -y grep && \
    apt install -y lsb-release && \
    apt autoremove -y

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos locais para o container
#COPY . .

# Define o comando padrão para rodar quando iniciar o container
CMD ["bash"]
