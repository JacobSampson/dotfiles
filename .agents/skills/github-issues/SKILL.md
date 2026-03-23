---
name: github-issues
description: Create and manage GitHub issues directly from your chat interface. Use this skill when the user wants to create, view, edit, list, close, or comment on GitHub issues, or when they mention tracking bugs, feature requests, or tasks in a repository.
---

# GitHub Issues Skill

Manage GitHub issues using the `gh` CLI. All commands work from within a git repository or with `-R owner/repo` to target a specific repo.

## Reading Issues

### View a single issue

```bash
gh issue view <number>
```

Get structured data for programmatic use:

```bash
gh issue view <number> --json title,body,state,labels,assignees,comments
```

Available JSON fields: `assignees`, `author`, `body`, `closed`, `closedAt`, `comments`, `createdAt`, `id`, `isPinned`, `labels`, `milestone`, `number`, `projectItems`, `state`, `stateReason`, `title`, `updatedAt`, `url`

### View with comments

```bash
gh issue view <number> --comments
```

### List issues

```bash
gh issue list                              # Open issues (default)
gh issue list --state all                  # All issues
gh issue list --state closed               # Closed only
gh issue list --assignee "@me"             # Assigned to current user
gh issue list --label "bug"                # Filter by label
gh issue list --search "error in:title"    # Search query
gh issue list --json number,title,state    # JSON output
```

## Creating Issues

```bash
gh issue create --title "Bug: X doesn't work" --body "Description here"
```

With metadata:

```bash
gh issue create \
  --title "Feature request" \
  --body "Details..." \
  --label "enhancement" \
  --assignee "@me" \
  --milestone "v1.0"
```

Read body from file (useful for longer descriptions):

```bash
gh issue create --title "Title" --body-file description.md
```

## Updating Issues

### Edit title or body

```bash
gh issue edit <number> --title "New title"
gh issue edit <number> --body "Updated description"
gh issue edit <number> --body-file updated.md
```

### Manage labels

```bash
gh issue edit <number> --add-label "bug,priority"
gh issue edit <number> --remove-label "wontfix"
```

### Manage assignees

```bash
gh issue edit <number> --add-assignee "@me"
gh issue edit <number> --remove-assignee "username"
```

### Manage milestones and projects

```bash
gh issue edit <number> --milestone "Sprint 1"
gh issue edit <number> --remove-milestone
gh issue edit <number> --add-project "Roadmap"
```

### Batch edit multiple issues

```bash
gh issue edit 1 2 3 --add-label "reviewed"
```

## Comments

```bash
gh issue comment <number> --body "Thanks for reporting!"
```

Edit or delete your last comment:

```bash
gh issue comment <number> --edit-last --body "Updated comment"
gh issue comment <number> --delete-last --yes
```

## State Changes

### Close an issue

```bash
gh issue close <number>
gh issue close <number> --reason "completed"
gh issue close <number> --reason "not planned"
gh issue close <number> --comment "Fixed in PR #42"
```

### Reopen an issue

```bash
gh issue reopen <number>
gh issue reopen <number> --comment "Reopening for further investigation"
```

## Advanced: API Access

For operations not covered by `gh issue`, use the REST API directly:

```bash
# Get issue details
gh api repos/{owner}/{repo}/issues/<number>

# Get all comments on an issue
gh api repos/{owner}/{repo}/issues/<number>/comments

# Add a reaction to an issue
gh api repos/{owner}/{repo}/issues/<number>/reactions -f content="+1"
```

## Tips

- Use `--json` with `--jq` to extract specific fields: `gh issue view 1 --json body --jq .body`
- Pipe body content: `echo "Description" | gh issue create --title "Title" --body-file -`
- Target any repo: `gh issue list -R owner/repo`
