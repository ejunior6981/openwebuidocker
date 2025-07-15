# Use the official Open WebUI image as the base
FROM ghcr.io/open-webui/open-webui:main

# Switch to the root user to perform installations and permission changes
USER root

# Use apt-get for Debian-based images to install the Docker CLI
RUN apt-get update && apt-get install -y --no-install-recommends docker.io

# CRITICAL FIX: Change ownership of the data directory to the non-root user.
# The application runs as user 1000 and needs to write to this directory.
RUN chown -R 1000:1000 /app/backend/data

# Switch back to the non-root user to run the application
USER 1000
