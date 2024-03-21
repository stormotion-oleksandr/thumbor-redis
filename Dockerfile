# Use the official Python image as a base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

ENV REDIS_STORAGE_IGNORE_ERRORS=True \
    REDIS_STORAGE_SERVER_PORT=6379 \
    REDIS_STORAGE_SERVER_HOST="redis" \
    REDIS_STORAGE_SERVER_DB=0      \
    REDIS_STORAGE_SERVER_PASSWORD=None \
    REDIS_STORAGE_MODE="single_node" \
    REDIS_RESULT_STORAGE_IGNORE_ERRORS=True \
    RESULT_STORAGE="tc_redis.result_storages.redis_result_storage" \
    REDIS_RESULT_STORAGE_SERVER_PORT=6379 \
    REDIS_RESULT_STORAGE_SERVER_HOST="redis" \
    REDIS_RESULT_STORAGE_SERVER_DB=0 \
    REDIS_RESULT_STORAGE_SERVER_PASSWORD=None \
    REDIS_RESULT_STORAGE_MODE="single_node"

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code into the container
COPY . .

# Command to run thumbor
CMD ["thumbor", "--conf=/app/thumbor.conf"]
# CMD ["thumbor"]