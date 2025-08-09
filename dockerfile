# Dockerfile
FROM python:3.10.12

# Install venv and clean apt cache
RUN apt-get update && apt-get install -y python3-venv && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements first (cache benefit)
COPY requirements.txt /app/

# Create a virtualenv and install dependencies into it
RUN python3 -m venv /opt/env && \
    /opt/env/bin/pip install --upgrade pip && \
    /opt/env/bin/pip install --no-cache-dir -r requirements.txt

# Copy app source
COPY . /app/

# Expose Flask port
EXPOSE 5000

# Run app.py with the venv python binary (no need for FLASK_APP env)
CMD ["/opt/env/bin/python", "app.py"]
