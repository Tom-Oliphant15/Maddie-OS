# Maddie OS, Using the Terminal

*When you'll need it, how to open it, how to run a command. Tom walks you through this in person during install; this is the written reference for any time after that. Read it any time by saying "terminal" or "/help terminal".*

---

## What the terminal is

The terminal is a place where you type commands directly to your Mac. Your OS uses it behind the scenes for things like syncing with GitHub, moving files around, and checking what's installed. Most of the time you won't see it.

Occasionally you'll need to run a command yourself. Two situations:

1. **During install or troubleshooting.** Something needs to happen on your laptop and Claude has been blocked from doing it for safety reasons. Claude will give you the exact command to paste.
2. **When Tom asks.** Tom messages you something to paste in (usually one line) to fix or check something.

You will never have to write commands yourself. Claude or Tom always gives you the exact text. Your job is paste, run, read what comes back.

---

## How to open it inside Claude Code

The terminal lives in a panel on the **right-hand side** of your Claude Code window.

To open it:

- Look for the terminal toggle in Claude Code's interface (usually a small icon or button on the right side of the window).
- Or use the keyboard shortcut for toggling the terminal panel.
- Or open the View menu and find the terminal option.

Tom showed you the exact toggle for your setup during install. If you've forgotten, ask Claude: `how do I open the terminal`.

---

## How to run a command

Three steps. That's it.

1. **Click inside the terminal panel** so your cursor is there (you should see a flashing line in the panel).
2. **Paste the command** with `Cmd + V`. Right-click and Paste also works.
3. **Press Enter** to run it.

Output appears below the command. When it's done, you'll see your prompt come back (a `%` or `$` symbol with your username next to it) which means the terminal is ready for the next thing.

---

## What to do if something looks wrong

The terminal shows error messages in plain text. They look intimidating but they're just text. Three options, in this order:

1. **Copy what's on screen and paste it into the Claude Code conversation.** Claude can read terminal output and tell you what happened. This is the fastest fix 90% of the time.
2. **Try the command again.** Sometimes a network blip causes a one-off failure and a second run works.
3. **Ping Tom on Slack `#leadership`** with the error text if Claude can't sort it.

You do not need to interpret error messages yourself. Your job is to get the text to Claude or Tom. Their job is to read it.

---

## What common commands look like

You will not need to remember any of these. Reference only, so the shapes feel familiar when Claude gives you one.

- `cd "~/Documents/Maddie OS"` — moves into your OS folder
- `git status` — shows what's changed in your OS that hasn't been saved
- `git push` — uploads any pending changes to GitHub
- `git pull` — downloads anything Tom has pushed since you last synced
- `brew install jq` — installs a tool called jq

The double quotes around paths with spaces (like `"Maddie OS"`) matter. Always copy commands exactly as given, including punctuation.

---

## Anti-panic notes

Three things to remember if the terminal ever looks scary:

1. **You cannot break your laptop by running a command Claude or Tom gave you.** Neither of us will ever give you something destructive without saying so first.
2. **You can always stop a running command** by pressing `Ctrl + C` (the Control key, not Command). The terminal returns to its prompt.
3. **Closing the terminal panel doesn't delete anything.** It just hides the panel. Re-open it and the history is still there.

If you get stuck, say `/help` in Claude Code and describe what you're seeing. Or ping Tom in `#leadership`. Both work.

---

*Linked from: [[Brain Directory#Onboarding]], [[Daily Cheat Sheet#When something's off]].*
