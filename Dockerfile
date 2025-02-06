FROM debian:latest

# Install dependencies
RUN apt-get update && apt-get install -y icecast2 passwd && rm -rf /var/lib/apt/lists/*

# Create a non-root user and group properly
RUN groupadd -r icecast || true
RUN useradd -r -g icecast -d /usr/local/icecast icecast || true

# Create necessary directories and set ownership
RUN mkdir -p /usr/local/icecast/logs /var/run/icecast /etc/icecast2 && \
    touch /usr/local/icecast/logs/error.log /usr/local/icecast/logs/access.log && \
    chown -R icecast:icecast /usr/local/icecast /var/run/icecast /etc/icecast2

# Copy Icecast configuration
COPY icecast.xml /etc/icecast.xml
RUN chown icecast:icecast /etc/icecast.xml

# Expose ports
EXPOSE 8000

# Switch to non-root user
USER icecast

# Start Icecast
CMD ["icecast2", "-c", "/etc/icecast.xml"]
