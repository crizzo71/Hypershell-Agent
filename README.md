# Hypershell-Agent

A small launcher for the HyperShell GitHub-to-Jira reconciliation agent in Codex CLI.

## What it does

- Starts Codex CLI in your local HyperShell repository
- Inventories open GitHub issues
- Compares them with Jira
- Produces a reconciliation report in Markdown, JSON, and CSV
- Runs read-only by default
- Requires explicit approval before any Jira write

## Install

```bash
git clone git@github.com:crizzo71/Hypershell-Agent.git
cd Hypershell-Agent
make install
```

This installs `hypershell-agent` into `~/.local/bin`.

## Use

Read-only reconciliation:

```bash
hypershell-agent
```

Write-enabled reconciliation, still requiring explicit approval:

```bash
hypershell-agent --apply
```

Help:

```bash
hypershell-agent --help
```

## Configuration

The launcher uses sensible defaults for the HyperShell project:

- GitHub repository: `openshift-online/hypershell`
- Jira project: `HYPERSHELL`
- Jira board: `13804`
- Local repository: `$HOME/hypershell`

Override them with environment variables:

```bash
export HYPRSHELL_AGENT_GITHUB_REPO=openshift-online/hypershell
export HYPRSHELL_AGENT_JIRA_PROJECT=HYPERSHELL
export HYPRSHELL_AGENT_JIRA_BOARD=13804
export HYPRSHELL_AGENT_REPO="$HOME/hypershell"
```

Or with command-line flags:

```bash
hypershell-agent \
  --github-repo openshift-online/hypershell \
  --jira-project HYPERSHELL \
  --jira-board 13804 \
  --repo "$HOME/hypershell"
```

## Safety model

- Read-only by default
- No Jira writes without explicit approval
- No duplicate issue creation
- No exposure of Jira credentials
- Always produces a reviewable report first

## Requirements

- Codex CLI
- Access to the HyperShell repository
- Jira credentials configured for Codex or the environment

## Repository layout

```text
bin/hypershell-agent   Launcher script
docs/usage.md          Detailed usage guide
Makefile               Install and uninstall targets
```
