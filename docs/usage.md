# Hypershell-Agent usage

## Basic run

```bash
hypershell-agent
```

Starts Codex CLI in read-only mode.

## Write-enabled run

```bash
hypershell-agent --apply
```

Prepares the reconciliation workflow and waits for explicit approval before any Jira write.

## Options

```bash
hypershell-agent --help
```

Supported options:

- `--apply`
- `--github-repo <owner/repo>`
- `--jira-project <KEY>`
- `--jira-board <ID>`
- `--repo <path>`
- `--help`

## Environment variables

- `HYPRSHELL_AGENT_GITHUB_REPO`
- `HYPRSHELL_AGENT_JIRA_PROJECT`
- `HYPRSHELL_AGENT_JIRA_BOARD`
- `HYPRSHELL_AGENT_REPO`
- `HYPRSHELL_AGENT_CODEX_BIN`

## Expected output

The agent should produce:

1. A Markdown reconciliation report
2. A JSON reconciliation matrix
3. A CSV summary

Each row should include:

- GitHub issue number
- GitHub title
- GitHub labels
- Candidate Jira issue
- Match type
- Confidence
- Recommended Jira epic
- Recommended action
- Notes

## Safety

- Read-only by default
- Explicit approval required for writes
- No duplicate creation
- No unrelated modifications
- Jira credentials are never printed
