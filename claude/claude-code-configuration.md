# Configuration File Layout and Usage in Claude Code

## Settings files (JSON) for configuring behavior

Claude Code configuration can be managed via hierarchical `settings.json` files in multiple scopes:

### Global/User-Level (persistent across projects)

*   `~/.claude/settings.json` (primary user-level settings).    
*   `~/.claude/settings.local.json` (user-specific overrides, typically .gitignored).[Anthropic+4Anthropic+4ClaudeLog+4](https://docs.anthropic.com/en/docs/claude-code/settings?utm_source=chatgpt.com)
    

### Main Global (highest-priority global)

*   `~/.claude.json` — often recommended for broad overrides across all projects.[Anthropic+7ClaudeLog+7ClaudeLog+7](https://www.claudelog.com/faqs/where-are-claude-code-global-settings/?utm_source=chatgpt.com)
    

### Project-Level
* Shared:  `.claude/settings.json` (committed, team-shared settings).  
* Local override:  `.claude/settings.local.json` (personal project-specific overrides, set to be ignored in gitignore).[Anthropic+4Anthropic+4ClaudeLog+4](https://docs.anthropic.com/en/docs/claude-code/settings?utm_source=chatgpt.com)
  

## Subagent Files

Claude Code lets you define custom subagents using Markdown files (with YAML frontmatter) that Claude can invoke during sessions. These are stored in:

*   User-level: `~/.claude/agents/`   
*   Project-level: `.claude/agents/`[ClaudeLog+5Anthropic+5ClaudeLog+5](https://docs.anthropic.com/en/docs/claude-code/settings?utm_source=chatgpt.com)


## Command Files



## CLAUDE.md (Memory files)

`CLAUDE.md` files help Claude retain context—like coding conventions, commands, or setup notes. They can be placed in several key locations:

*   Repository root (or whatever directory you run `claude` from) — the most common spot.   
*   Any parent folder of that directory—useful for monorepos.
*   Any child directory—Claude will load them on-demand when working with files in those children.
*   Your home directory at `~/.claude/CLAUDE.md`—applies across all Claude Code sessions.[ClaudeLog+6Anthropic+6ClaudeLog+6](https://www.anthropic.com/engineering/claude-code-best-practices?utm_source=chatgpt.com)

