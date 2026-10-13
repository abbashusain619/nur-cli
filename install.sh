#!/bin/bash
set -e

echo "🚀 Installing Nuru Package Manager (nur)..."

INSTALL_DIR="$HOME/.nur/bin"
mkdir -p "$INSTALL_DIR"

echo "⬇️ Fetching Linux binary..."
DOWNLOAD_URL="https://github.com/abbashusain619/nur-cli/releases/latest/download/nur"
curl -L -o "$INSTALL_DIR/nur" "$DOWNLOAD_URL"

chmod +x "$INSTALL_DIR/nur"

echo "🔧 Configuring system PATH..."

# 1. Fish shell (Garuda/Custom)
if [ -d "$HOME/.config/fish" ]; then
    grep -qxF 'set -gx PATH $HOME/.nur/bin $PATH' "$HOME/.config/fish/config.fish" || echo 'set -gx PATH $HOME/.nur/bin $PATH' >> "$HOME/.config/fish/config.fish"
    echo "✅ Fish shell configured."
fi

# 2. Bash shell (Ubuntu/Debian default)
if [ -f "$HOME/.bashrc" ]; then
    grep -qxF 'export PATH="$HOME/.nur/bin:$PATH"' "$HOME/.bashrc" || echo 'export PATH="$HOME/.nur/bin:$PATH"' >> "$HOME/.bashrc"
    echo "✅ Bash shell configured."
fi

# 3. Zsh shell (macOS default)
if [ -f "$HOME/.zshrc" ]; then
    grep -qxF 'export PATH="$HOME/.nur/bin:$PATH"' "$HOME/.zshrc" || echo 'export PATH="$HOME/.nur/bin:$PATH"' >> "$HOME/.zshrc"
    echo "✅ Zsh shell configured."
fi

echo "✅ Installation complete! Restart your terminal to use 'nur'."