# Install MCP Configs and Wrapper Scripts

Reference: the exact config blocks and wrapper scripts to add during steps 8 (Google Workspace), 9 (Slack), and 10 (Metricool). Procedural framing (plain-English explainer, OAuth flow, test step, failure modes) lives in the skill body.

All MCP configs go in: `~/Library/Application Support/Claude/claude_desktop_config.json` under `mcpServers`.

Tokens never live in plain text in config files. Every token is fetched at MCP launch from the macOS Keychain via a wrapper script.

---

## Step 8: Google Workspace MCP

### Config block

```json
{
  "google-workspace-maddie": {
    "command": "/Users/maddie/.local/bin/workspace-mcp-launch.sh",
    "env": {
      "GOOGLE_OAUTH_USER": "marketing@fadegroup.uk"
    }
  }
}
```

The launch wrapper script handles ephemeral-port allocation to avoid the workspace-mcp collision issue documented in Tom's CLAUDE.md.

### Setup the wrapper script if missing

```bash
mkdir -p ~/.local/bin
curl -fsSL \
  https://raw.githubusercontent.com/Tom-Oliphant15/Maddie-OS/main/install-assets/workspace-mcp-launch.sh \
  -o ~/.local/bin/workspace-mcp-launch.sh
chmod +x ~/.local/bin/workspace-mcp-launch.sh
```

---

## Step 9: Slack MCP

### Config block

```json
{
  "slack-fade-group-maddie": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-slack"],
    "env": {
      "SLACK_TEAM_ID": "T0AUUAU0SH",
      "SLACK_USER_TOKEN": "<set via OAuth, never written to this file>"
    }
  }
}
```

Slack token is stored in macOS Keychain, fetched at MCP launch via a wrapper script that the install creates. Token never lives in plain text.

### Wrapper script

```bash
mkdir -p ~/.local/bin
cat > ~/.local/bin/slack-mcp-launch.sh <<'EOF'
#!/bin/bash
SLACK_USER_TOKEN=$(security find-generic-password -a maddie -s slack-fade-group-token -w 2>/dev/null)
if [ -z "$SLACK_USER_TOKEN" ]; then
  echo "slack-mcp-launch: no token in keychain (account=maddie, service=slack-fade-group-token)" >&2
  exit 1
fi
export SLACK_USER_TOKEN
exec npx -y @modelcontextprotocol/server-slack "$@"
EOF
chmod +x ~/.local/bin/slack-mcp-launch.sh
```

### Store the OAuth token in Keychain

After Maddie completes the Slack OAuth flow in browser and copies the user token:

```bash
security add-generic-password \
  -a maddie -s slack-fade-group-token \
  -w "$TOKEN_FROM_OAUTH"
```

---

## Step 10: Metricool MCP

### Config block

```json
{
  "metricool-maddie": {
    "command": "/Users/maddie/.local/bin/metricool-mcp-launch.sh",
    "env": {
      "METRICOOL_ACCOUNT": "marketing@fadegroup.uk"
    }
  }
}
```

Wrapper script + Keychain pattern as per Slack MCP (token in Keychain, never in config file).
