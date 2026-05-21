#!/bin/bash
# Auto-allocate a free port for workspace-mcp's OAuth callback server.
# Prevents collisions when multiple workspace-mcp instances run simultaneously
# (e.g. across Desktop chats, or Desktop + Code). Google's http://localhost
# redirect is port-agnostic for installed-app OAuth, so any port works.
#
# Portable: looks up workspace-mcp via PATH or $HOME/.local/bin so this script
# is identical across Tom's machine, Maddie's MacBook, and any future install.

PORT=$(python3 -c "import socket; s=socket.socket(); s.bind(('127.0.0.1',0)); print(s.getsockname()[1]); s.close()")
export WORKSPACE_MCP_PORT="$PORT"

# Resolve workspace-mcp: prefer PATH, fall back to $HOME/.local/bin
WORKSPACE_MCP_BIN="$(command -v workspace-mcp || true)"
if [ -z "$WORKSPACE_MCP_BIN" ] && [ -x "$HOME/.local/bin/workspace-mcp" ]; then
  WORKSPACE_MCP_BIN="$HOME/.local/bin/workspace-mcp"
fi

if [ -z "$WORKSPACE_MCP_BIN" ]; then
  echo "workspace-mcp-launch: workspace-mcp not found on PATH or in \$HOME/.local/bin" >&2
  echo "  Install it with: pipx install workspace-mcp" >&2
  exit 1
fi

exec "$WORKSPACE_MCP_BIN" "$@"
