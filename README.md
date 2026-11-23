# Little Workflow Scripts

These are hand-written scripts I used to navigate and make things more efficient before AI. I still use them when I switch branches manually.

Each script bundles a routine, multi-step task into a single command, so I can run it in one step and work faster. Run them from inside any repo, unless noted otherwise.

## Setup

Clone the repo and link the scripts onto your PATH.

```bash
gh repo clone rachelrly/little-scripts
cd little-scripts
for s in checkout-file.sh commit.sh dbnew.sh html-server.sh new-branch.sh search-history.sh teammate-branch.sh
do
  chmod +x "$s"
  sudo ln -sf "$PWD/$s" /usr/local/bin/"$s"
done
```

## Scripts

- **checkout-file.sh** — Check out a single file from another branch, without switching branches. Shows `git status` afterwards, and errors if an argument is missing.
  Usage: `checkout-file.sh [branch] [file]`

- **commit.sh** — Stage, commit, and push in one step. Refuses to run on `main`. With the special argument `db`, it runs the data migrations first, stages only `db/`, and commits as "update db"; with any other argument, it stages everything and uses that argument as the commit message.
  Usage: `commit.sh [message]` or `commit.sh db`

- **dbnew.sh** — Rebuild a Rails database from scratch. Deletes `test.log`, `development.log`, and `delayed_job.log` from `log/` if they exist, then drops, creates, migrates, and seeds the database.
  Usage: `dbnew.sh`

- **html-server.sh** — Serve a local HTML project with Python's built-in web server on port 9999.
  Usage: `html-server.sh [name]`

- **new-branch.sh** — Start a clean new branch from an up-to-date `main`. Discards local changes with a hard reset, checks out `main`, pulls the latest from origin, then creates and switches to the new branch.
  Usage: `new-branch.sh [branch-name]`

- **search-history.sh** — Search your zsh history for a term, case-insensitively, and page through the matches in `less`. Does not need to be run inside a repo.
  Usage: `search-history.sh [term]`

- **teammate-branch.sh** — Switch to a teammate's branch without losing your own work. Stashes your local changes, fetches, checks out and pulls their branch, then pops your stash back on top.
  Usage: `teammate-branch.sh [branch]`
