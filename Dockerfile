
# Use a imagem oficial do MinIO
FROM quay.io/minio/minio

# Define o diretório de trabalho
WORKDIR /root/.minio

# Exponha as portas padrão
EXPOSE 9000 9001

# Comando de inicialização do MinIO
CMD ["server", "/data", "--console-address", ":9001"]

