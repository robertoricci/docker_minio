# Dockerfile para MinIO AIO

# Base image
FROM minio/minio

# Set environment variables
ENV MINIO_ROOT_USER=admin \
    MINIO_ROOT_PASSWORD=password \
    MINIO_DOMAIN=minio \
    MINIO_REGION_NAME=us-east-1 \
    MINIO_REGION=us-east-1

# Expose MinIO and Console ports
EXPOSE 9000 9001

# Entrypoint command to set up and run MinIO
CMD ["/bin/sh", "-c", "\
    minio server /data --console-address ':9001' & \
    sleep 5; \
    mc alias set myminio http://localhost:9000 admin password; \
    mc mb myminio/datalake; \
    mc mb myminio/datalakehouse; \
    tail -f /dev/null"]
