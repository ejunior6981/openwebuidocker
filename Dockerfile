# Use the official Open WebUI image as the base
FROM ghcr.io/open-webui/open-webui:main

# Switch to the root user to install packages
USER root

# Use apt-get for Debian-based images.
# First, update the package lists.
# Then, install the Docker CLI client.
RUN apt-get update && apt-get install -y --no-install-recommends docker.io

# Switch back to the non-root user for security
USER 1000
