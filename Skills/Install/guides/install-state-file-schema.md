# Install State File Schema

Reference for `.install-state.json`, the source of truth for Install progress.

**Location:** project root, `.install-state.json` (committed to git, so Tom can see install progress remotely).

**Status values:** `pending`, `pass`, `fail`, `deferred`.

**On every state change, commit the file** so Tom sees install progress live.

## Schema

```json
{
  "version": 1,
  "last_run_started": "2026-05-19T09:00:00Z",
  "last_run_completed": null,
  "machine_hostname": "Maddies-MacBook-Pro.local",
  "steps": {
    "homebrew_installed":           { "status": "pending", "tested_at": null, "error": null },
    "gh_cli_installed":             { "status": "pending", "tested_at": null, "error": null },
    "claude_code_installed":        { "status": "pending", "tested_at": null, "error": null },
    "github_deploy_key_generated":  { "status": "pending", "tested_at": null, "error": null },
    "github_deploy_key_authorised": { "status": "pending", "tested_at": null, "error": null },
    "git_clone":                    { "status": "pending", "tested_at": null, "error": null },
    "gh_cli_authenticated":         { "status": "pending", "tested_at": null, "error": null },
    "google_workspace_mcp":         { "status": "pending", "tested_at": null, "error": null },
    "slack_mcp":                    { "status": "pending", "tested_at": null, "error": null },
    "metricool_mcp":                { "status": "pending", "tested_at": null, "error": null },
    "first_push":                   { "status": "pending", "tested_at": null, "error": null },
    "diagnostics_first_run":        { "status": "pending", "tested_at": null, "error": null },
    "learning_first_run":           { "status": "pending", "tested_at": null, "error": null },
    "onboarding_p1_bar":            { "status": "pending", "tested_at": null, "p1_remaining": null, "error": null },
    "state_files_initialised":      { "status": "pending", "tested_at": null, "error": null }
  }
}
```
