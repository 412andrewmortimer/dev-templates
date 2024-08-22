FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user 'vscode' with sudo privileges
RUN useradd -m vscode && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Ensure vscode has proper ownership of /workspaces
RUN mkdir -p /workspaces && chown -R vscode:vscode /workspaces

# # Copy init script
COPY ../init.sh /workspaces/dev-templates/.devcontainer/init.sh

# Make the script executable
RUN chmod +x /workspaces/dev-templates/.devcontainer/init.sh

# Set the default user to 'vscode'
USER vscode
WORKDIR /workspaces