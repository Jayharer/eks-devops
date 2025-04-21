# base image
FROM python:3.9

# current working directory inside container
WORKDIR /code

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your app code
COPY . .

# Create a non-root user
RUN useradd -m fastapiuser

# Set permissions fo fastapiuser on app directory
RUN chown -R fastapiuser:fastapiuser /code

# Switch to non-root user
USER fastapiuser

# Expose app port
EXPOSE 8080

# run application on 8080 port
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]