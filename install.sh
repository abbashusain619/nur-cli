#!/bin/bash
set -e

echo "Installing Nuru Package Manager (nur)..."
INSTALL_DIR="$HOME/.nur/bin"
mkdir -p "$INSTALL_DIR"

echo "Fetching binary..."

cp dist/nur "$INSTALL_DIR/nur"

chmod +x "$INSTALL_DIR/nur"

echo "Configuring systen PATH..."

#fish shell config
if [ -d "$HOME/.config/fish" ]; then
    grep -qxF 'set -gx PATH $home/.nur/bin $PATH' "$HOME/.config/fish/config.fish" || echo 'set -gx PATH $HOME/.nur/bin $PATH' >> "$HOME/.config/fish/config.fish"
    echo "Fish shell configured."
fi

echo "Installation complete!"