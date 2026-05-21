# Install Slack Escalation Templates

When option B is chosen on an L3 failure during Install, draft using these templates and show Maddie for confirmation before sending. **She always sends, not the OS.**

Pick the template matching the failed step. If none fits, use B-GENERIC.

---

## Template B-DEPLOY-KEY-FAIL

```
Hey Tom, install is paused at deploy-key authorisation.
I generated the key on this Mac, but the test SSH connect to GitHub failed.
That usually means the key has not been added to the repo yet, or it has been added with read-only access.

Public key:
[key block]

Repo: Tom-Oliphant15/Maddie-OS
Title suggestion: Maddie MacBook YYYY-MM-DD
Permission: read-write

I will retry the test when you give the nod.
```

---

## Template B-GOOGLE-OAUTH-FAIL

```
Hey Tom, Google Workspace MCP is failing OAuth.
Error from the test call: [error]
I think I might have signed into the wrong Google account, or the permissions screen had an option I missed.

Want me to walk through it again, or do you want to look at the MCP config?
```

---

## Template B-SLACK-OAUTH-FAIL

```
Hey Tom, Slack MCP OAuth is not completing.
Error: [error]
I think the workspace install requires admin approval and my user is not admin. Can you approve the app, or send me to whoever can?
```

---

## Template B-GENERIC

```
Hey Tom, install is stuck on step [N]: [step name].
Error: [error from test command]
What I have tried: [list]
Happy to dig further if you guide, or wait for you to look at the repo state directly.
```
