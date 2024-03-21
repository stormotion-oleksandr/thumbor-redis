# Use the official Python image as a base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code into the container
COPY . .

# Command to run thumbor
CMD ["thumbor", "--conf=/app/thumbor.conf"]
# CMD ["thumbor"]