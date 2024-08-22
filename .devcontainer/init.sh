#!/bin/bash

# Enable Experimental Features
NIX_CONF="/etc/nix/nix.conf"
echo "experimental-features = nix-command flakes" >> "$NIX_CONF"
echo "Experimental features enabled."

# Enable Non-Free Packages
NIXPKGS_CONF="/home/vscode/.config/nixpkgs/config.nix"
mkdir -p "$(dirname "$NIXPKGS_CONF")"
echo "{ allowUnfree = true; }" > "$NIXPKGS_CONF"
echo "Non-free packages enabled."

# Set ownership of /workspace to the vscode user
echo "Setting ownership of /workspaces to vscode user."
chown -R vscode /workspaces

# Source the configuration files to apply changes
source /etc/profile
echo "Configuration complete. Please restart your shell or source the configuration files if necessary."

exit 0