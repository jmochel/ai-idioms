# Cursor Configuration and Rules File Patterns

## Global Configuration

Global Cursor configuration is stored in the user's home directory under `~/.cursor/`. This configuration applies to all Cursor instances across all workspaces and repositories unless overridden by workspace or repository-specific settings.

### Standard Locations

- **User Settings**: Configured via `Cursor Settings` UI (accessible via `Ctrl/⌘ + Shift + J` or `Ctrl/⌘ + Shift + P` → "Cursor Settings")
- **Global MCP Configuration**: `~/.cursor/mcp.json` — Model Context Protocol server configuration
- **Application Logs**: 
  - Linux/macOS: `~/.cursor/logs/`

### Global Configuration Scope

Global settings include:
- **User Rules**: Configured via Settings UI (`Cursor Settings` → `User Rules`). These are global AI instructions that apply to all projects unless overridden.
- **Model Configuration**: API keys for OpenAI, Anthropic, Azure, Google, and custom model providers
- **Feature Toggles**: Chat settings, Tab behavior, web search preferences, and other feature-specific configurations
- **MCP Servers**: Global Model Context Protocol server definitions

### Best Practices

- Keep global User Rules minimal and generic; push project-specific rules to repository-level configuration
- Store API keys securely through the Settings UI; they are transmitted to Cursor servers for prompt building
- Global MCP configuration serves as a base template that can be extended or overridden at repository level

---

## Workspace Configuration

Workspace-level configuration applies to a specific workspace root (typically a parent directory containing multiple projects or a single large project). This level sits between global and repository configuration.

### Standard Locations

- **Workspace Rules**: `~/projects/.cursor/workspace.yaml` or similar workspace root configurations
- **Workspace MCP**: `~/projects/.cursor/mcp.json` (optional, extends global MCP)

### Configuration Scope

Workspace settings typically override global defaults for:
- Shared coding standards across related projects
- Common MCP server configurations for a development environment
- Workspace-specific model preferences or feature toggles

### Inheritance

Workspace configuration inherits from global settings and can be overridden by repository-specific configuration.

---

## Repository Configuration

Repository-specific configuration is stored within the `.cursor/` directory at the repository root. This is the most specific and commonly used level for project-specific AI rules and settings.

### Standard Locations

- **Repository Rules Directory**: `repo/.cursor/rules/` — Contains rule files (`.mdc`, `.md`, or `.yaml`)
- **Main Project Rules**: `repo/.cursor/index.mdc` or `repo/.cursorrules` — Always-applied project rules
- **Repository MCP**: `repo/.cursor/mcp.json` — Project-specific MCP server configuration
- **Ignore Files**:
  - `repo/.cursorignore` — Excludes files/folders from AI context and search (follows `.gitignore` syntax)
  - `repo/.cursorindexingignore` — Fine-grained indexing exclusions for the search/indexer

### Directory Structure

```
repo/
├── .cursor/
│   ├── index.mdc              # Main always-on project rules
│   ├── rules/                  # Contextual rules by glob/path/filetype
│   │   ├── java-coding.mdc
│   │   ├── testing.mdc
│   │   └── security.mdc
│   ├── rules.local/            # (Optional) Project-specific overrides
│   ├── mcp.json                # Generated or merged MCP configuration
│   └── project.mcp.overlay.json # (Optional) Partial MCP overrides
├── .cursorrules                # Legacy format (still supported)
└── .cursorignore               # AI context exclusions
```

### Configuration Files

- **`.cursorrules`**: Legacy plain-text file format for project-specific AI instructions (simpler, single-file approach)
- **`.cursor/index.mdc`**: Always-applied rules using Markdown Container format (more structured, supports metadata)
- **`.cursor/rules/*.mdc`**: Contextual rules that activate based on file patterns or paths

### Best Practices

- Version control all `.cursor/` configuration files
- Use `rules.local/` for local-only overrides (add to `.gitignore`)
- Keep repository rules focused on project-specific standards, architecture, and conventions

---

## Rules File Organization

Rules files define AI behavior, coding standards, and project-specific guidelines. They can be organized by domain, technology stack, or architectural concerns.

### File Formats

#### Markdown Container (`.mdc`)

Introduced in Cursor 0.45, `.mdc` files combine YAML frontmatter with Markdown content. These files support file pattern matching and are typically used for agent mode, chat, and compose features.

**Structure:**
```yaml
---
description: Brief rule description
globs: "**/*.js"              # File patterns this rule applies to
alwaysApply: false             # Whether to always include this rule
---

# Rule Content (Markdown)

- Use structured logging with Winston
- Avoid using `console.log`
- Ensure all error logs include stack traces
```

**When to Use:**
- Complex rules requiring extensive documentation
- Rules that need examples and context
- Domain-specific guidelines (architecture, testing, security)
- Rules targeting specific file patterns or directories

#### Markdown (`.md`)

Plain Markdown files without YAML frontmatter. Used for simpler, always-applied rules or documentation-style guidelines.

**When to Use:**
- Simple, narrative rules
- Architectural decisions and design patterns
- Best practices documentation
- Rules that don't need file pattern matching

#### YAML (`.yaml` or `.yml`)

Structured, machine-readable format for pattern-based rules and validation.

**Structure:**
```yaml
id: unique-rule-id
pattern: code_pattern_to_match
message: warning_or_error_message
severity: WARNING | ERROR
tags: [category1, category2]
```

**When to Use:**
- Simple, pattern-based validation rules
- Automated checks and tool-specific configurations
- Rules requiring precise pattern matching
- Technical rules that need programmatic processing

### Naming Conventions

- **Format**: Lowercase with hyphens for word separation
- **Extension**: `.mdc`, `.md`, `.yaml`, or `.yml`
- **Examples**:
  - `java-coding-standards.mdc`
  - `exception-handling.mdc`
  - `logging-guidelines.mdc`
  - `core-persona-and-approach.mdc`

### Organization Patterns

#### By Domain

```
.cursor/rules/
├── core/
│   ├── coding-standards.mdc
│   ├── architecture.mdc
│   └── testing.mdc
├── languages/
│   ├── java-quarkus-coding.mdc
│   ├── java-spring.mdc
│   └── go-guidelines.mdc
├── features/
│   ├── security.mdc
│   ├── monitoring.mdc
│   └── documentation.mdc
└── tooling/
    ├── maven.mdc
    └── git-commit-message-standards.mdc
```

#### By Numeric Prefix (Sequential)

```
.cursor/rules/
├── 00-core-persona.md
├── 10-java-guidelines.md
├── 20-java-unit-test-guidelines.md
├── 30-dbt-snowflake-guidelines.md
└── 90-contributing-to-rules.md
```

## Cursor Rules Numbering

* **`000-`** General (SpecKit, Git, ...) 
* **`100-`** Bash,ZSH,...
* **`200-`** Tooling (Go, ...)
* **`300-`** Java
* **`400-`** RDBMS


#### By Technology Stack

```
.cursor/rules/
├── rails8.mdc
├── models/
│   ├── active_record.mdc
│   └── postgresql.mdc
├── controllers/
│   ├── api.mdc
│   └── web.mdc
└── views/
    ├── erb.mdc
    └── components.mdc
```

### Glob Patterns

Rules can target specific file patterns using glob syntax:

- **File-Type Specific**: `globs: "**/*.tsx"` — Applies to all TypeScript React files
- **Directory-Scoped**: `globs: "src/components/**/*"` — Applies to all files in components directory
- **Pattern-Based**: `globs: "**/*{.test,.spec}.{ts,tsx}"` — Applies to test files
- **Universal**: `globs: "**/*.*"` — Applies globally when no specific rule matches
- **Exclusions**: `globs: "app/models/**/*.rb\n!app/models/legacy/**/*.rb"` — Exclude legacy patterns

### Rule Content Guidelines

- **Clear Title and Description**: Each rule should have a clear purpose
- **Rationale**: Explain why the rule exists
- **Examples**: Include compliant and non-compliant code examples
- **Cross-References**: Use `@` syntax to reference other rules or documentation files
- **Composable Rules**: Reference base rules in specialized rules using `@base_ruby.mdc` syntax

### Advanced Features

- **Composable Rule Sets**: Rules can reference and extend other rules
- **Conditional Activation**: Rules activate based on file patterns or explicit references
- **Always-Apply Flags**: Some rules (like `index.mdc`) are always included regardless of context

---

## Cross-References (Inheritance and Overrides)

Configuration and rules follow a hierarchical inheritance model where more specific levels override more general ones.

### Precedence Order

1. **Repository Configuration** (highest precedence)
   - `repo/.cursor/rules/*.mdc`
   - `repo/.cursor/index.mdc`
   - `repo/.cursorrules`
   - `repo/.cursor/mcp.json`

2. **Workspace Configuration** (medium precedence)
   - `~/projects/.cursor/workspace.yaml`
   - `~/projects/.cursor/mcp.json`

3. **Global Configuration** (lowest precedence)
   - `~/.cursor/` settings (via UI)
   - `~/.cursor/mcp.json`
   - User Rules (configured via Settings UI)

### Inheritance Behavior

- **Repository rules override workspace rules**, which override global defaults
- **File pattern matching** determines which contextual rules apply within a repository
- **Always-apply rules** (like `index.mdc`) are included regardless of file context
- **MCP configuration** can be merged: base global config + workspace overlay + repository overlay

### Override Mechanisms

- **Additive**: Repository rules extend global rules unless they conflict
- **Replacement**: Same-named rules at repository level replace workspace/global versions
- **Pattern Matching**: More specific glob patterns take precedence over general ones
- **Explicit References**: Rules can explicitly reference other rules using `@` syntax for composition

### Best Practices

- **Minimize Global Rules**: Keep global User Rules minimal; use for truly universal preferences
- **Centralize Shared Rules**: Use workspace configuration for standards shared across related projects
- **Repository-Specific**: Place project-specific architecture, naming conventions, and tooling rules in repository configuration
- **Version Control**: Always version control repository-level `.cursor/` configuration
- **Local Overrides**: Use `.cursor/rules.local/` for personal preferences that shouldn't be committed

---

## Summary

Cursor configuration operates at three levels: global (user-wide), workspace (multi-project), and repository (project-specific). Rules files support multiple formats (`.mdc`, `.md`, `.yaml`) and can be organized by domain, technology, or sequential numbering. The inheritance model ensures that repository-specific rules take precedence, while global defaults provide a consistent baseline. The most common pattern is storing contextual rules in `repo/.cursor/rules/*.mdc` with file pattern matching, complemented by always-applied rules in `repo/.cursor/index.mdc` or `repo/.cursorrules`.

