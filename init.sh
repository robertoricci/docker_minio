#!/bin/sh

# Espera o MinIO estar pronto
sleep 5

# Configura o alias do MinIO
mc alias set myminio http://localhost:9000 "$MINIO_ROOT_USER" "$MINIO_ROOT_PASSWORD"

# Cria buckets
mc mb myminio/datalake
mc mb myminio/datalakehouse

# Copia dados, se necessário
mc cp --recursive /minio-data/ myminio/datalake/
