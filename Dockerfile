FROM public.ecr.aws/docker/library/python:3.13-slim

WORKDIR /app

# Install build dependencies and the package
COPY pyproject.toml requirements.txt ./
COPY version/ ./version/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY app.py ./

# Create a non-root user to run the application
RUN useradd --create-home appuser
USER appuser

# Expose the 8080 Flask port
EXPOSE 8080

# Start the application
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
