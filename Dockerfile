# Use the official Open WebUI image as the base
FROM ghcr.io/open-webui/open-webui:main

# Switch to the root user to perform installations and permission changes
USER root

# Use apt-get for Debian-based images to install the Docker CLI
RUN apt-get update && apt-get install -y --no-install-recommends docker.io

# CRITICAL FIX: Change ownership of the data directory to YOUR user ID.
RUN chown -R 1026:100 /app/backend/data

# Switch back to the default non-root user for security
USER 1000
