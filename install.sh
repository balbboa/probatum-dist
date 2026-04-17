#!/usr/bin/env sh
set -e

RELEASE_URL="https://github.com/balbboa/probatum-dist/releases/download/continuous"
BIN_DIR="$HOME/.local/bin"
BIN="$BIN_DIR/probatum"

OS=$(uname -s)
ARCH=$(uname -m)
if [ "$OS" != "Linux" ] || [ "$ARCH" != "x86_64" ]; then
  echo "Unsupported platform: $OS/$ARCH. Only Linux x86_64 is supported at this time."
  exit 1
fi

mkdir -p "$BIN_DIR"

echo "Downloading probatum..."
curl -fL "$RELEASE_URL/probatum-linux-x86_64" -o "$BIN"
chmod +x "$BIN"

echo "Installed to $BIN"

case ":$PATH:" in
  *":$BIN_DIR:"*) ;;
  *) echo "NOTE: Add $BIN_DIR to your PATH:  export PATH=\"\$HOME/.local/bin:\$PATH\"";;
esac

echo "Run: probatum --help"
