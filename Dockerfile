
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

# Copy initialization script
COPY init.sh /usr/bin/init.sh
RUN chmod +x /usr/bin/init.sh

# Entrypoint command
ENTRYPOINT ["minio"]
CMD ["server", "/data", "--console-address", ":9001"]
