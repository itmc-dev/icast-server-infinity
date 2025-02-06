# Use Debian as base
FROM debian:latest

# Install Icecast2 + XSLT dependencies
RUN apt-get update && apt-get install -y icecast2 xsltproc && rm -rf /var/lib/apt/lists/*

# Ensure 'icecast' group exists
RUN getent group icecast || groupadd -r icecast

# Create a non-root user if missing
RUN id icecast 2>/dev/null || useradd -r -g icecast icecast

# Create necessary directories for Icecast logs and web admin
RUN mkdir -p /usr/local/icecast/logs && chown -R icecast:icecast /usr/local/icecast/logs
RUN mkdir -p /usr/share/icecast && chown -R icecast:icecast /usr/share/icecast
RUN mkdir -p /var/log/icecast2 && chown -R icecast:icecast /var/log/icecast2

# Set working directory
WORKDIR /etc/icecast2

# Copy the Icecast configuration
COPY icecast.xml /etc/icecast2/icecast.xml

# Ensure the Icecast user owns all files
RUN chown -R icecast:icecast /etc/icecast2 /usr/local/icecast/logs /usr/share/icecast /var/log/icecast2

# Switch to non-root user
USER icecast

# Expose Icecast streaming port
EXPOSE 4500

# Start Icecast as non-root user
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]