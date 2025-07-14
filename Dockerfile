# Use the official Open WebUI image as the base
FROM ghcr.io/open-webui/open-webui:main

# Switch to the root user to install packages
USER root

# Install the Docker CLI using the system's package manager (apk for Alpine Linux)
# --no-cache prevents storing the package index, keeping the image size smaller.
RUN apk add --no-cache docker-cli

# Switch back to the non-root user that the base image uses for running the application
USER 1000