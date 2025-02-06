# Use Debian as the base image
FROM debian:latest

# Install Icecast2 and XSLT dependencies
RUN apt-get update && apt-get install -y \
    icecast2 \
    xsltproc \
    && rm -rf /var/lib/apt/lists/*

# Ensure the icecast group exists by creating it only if it doesn't already exist
RUN getent group icecast || groupadd -g 10001 icecast \
    && id -u icecast >/dev/null 2>&1 || useradd -m -u 10001 -g icecast icecast

# Create directories for logs, config, and other Icecast resources
RUN mkdir -p /var/log/icecast2 /usr/share/icecast2/xslt /etc/icecast2 \
    && chown -R icecast:icecast /var/log/icecast2 /usr/share/icecast2 /etc/icecast2

# Set the working directory to Icecast's configuration directory
WORKDIR /etc/icecast2

# Copy the Icecast configuration into the container
COPY icecast.xml /etc/icecast2/icecast.xml

# Ensure all files and directories are owned by the Icecast user
RUN chown -R icecast:icecast /etc/icecast2 /var/log/icecast2 /usr/share/icecast2

# Run the container as the non-root user "icecast"
USER icecast

# Expose the Icecast streaming port (4500)
EXPOSE 4500

# Default command to start Icecast with the custom configuration
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]