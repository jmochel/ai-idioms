# References

Designing Prompts

What most developers start with:

- Saying “You are a helpful assistant” prompts.
- One prompt to rule them all.
- Personality lacking prompts.
- Prompts that break when users ask unexpected questions.
- Tool calling that feels very robotic.
- Tool calling gets over fitted and makes unnecessary tool calls.

As a template ,Define the 

- **AI role**
- **The tone**
- **Provide examples**
- **Specify data**
- **Describe the task**
- `TASK_CONTEXT`— What is the overarching goal and the AI’s persona *(coding agent, senior partner).* This helps with the entire AI interaction.
- `TONE_CONTEXT`— I noticed this at work but it’s backed up here, is there a specific tone needed *(friendly, analytical, authoritative)*. This helps the AI communication style.
- `DETAILED_TASK_DESCRIPTION`— Notice how they break down complex tasks. This one is very hard, I have found looking at multiple prompt examples helps with this.
- `EXAMPLES` — I was already doing this one, as an ex colleague shared this with me, this is currently one of the most powerful ways of explaining what you are expecting. If you aren’t expecting something, examples also help for this, provide the example with the response you wish you had.
- `INPUT_DATA,OUTPUT_FORMATTING`— I personally find these less relevant as I no longer use straight prompting and now use a library, but if you use straight prompting then I recommend this for you! I only really use this with the likes of Claude.
- `TOOL_CALLING`— This is massive for advanced prompting, the key to preventing over fitting *(the AI making unneeded tool calls)*. Things like *“only call tools when necessary”, “explain why you’re calling a tool”, and “never refer to tool names directly to the user”.* Will completely change everything for you.

# Claude Specific (Sort Of)

## **Level 1 — Use Templates:**

```
PROJECT CONTEXT:
- What I'm building: [Specific description]
- Tech stack: [Exact versions]
- User base: [Who uses this]
- Timeline: [Deadlines and constraints]

CURRENT SITUATION:
- What I'm trying to achieve: [Specific goal]
- What I've already tried: [Previous attempts]
- What's blocking me: [Specific problem]
- Success criteria: [What good looks like]

Now help me [specific request].
```

## **Level 2 — Use Prompts from previous conversations:**

```
I like these results, can you make prompt to help me achieve this in the future
```

**Level 3 — Update your Profile**

[](https://www.notion.so)

![image.png](AI%20Prompts%20for%20Engineering%2021df02c337d8802dbaddd0b4369621d3/image.png)

**Level 4 — Use Projects**

[](https://www.notion.so)

![image.png](AI%20Prompts%20for%20Engineering%2021df02c337d8802dbaddd0b4369621d3/image%201.png)

Projects are extremely useful to split context windows up and keep conversations in one area. You can then keep Project knowledge to help with all further chats.

![image.png](AI%20Prompts%20for%20Engineering%2021df02c337d8802dbaddd0b4369621d3/image%202.png)

# **Model Selection (Opus vs Sonnet)**

## **When I Use Sonnet 4 (80% of all work):**

- Code implementation and debugging
- Email drafting
- Documentation writing
- Quick questions

## **When I Use Opus 4 (20% of work):**

- System architecture decisions
- Complex business logic design
- Multi step problem solving
- Creative solutions

**Real examples:**

```
**Real Scenario:** Building a real-time chat feature for my side project.

**Sonnet's approach:** Basic WebSocket implementation with simple message broadcasting
**Time:** 2 minutes to get working code
**Result:** Worked for 5 users, broke at 20 concurrent connections

**Opus's approach:** WebSocket clustering with Redis pub/sub, connection pooling, and graceful fallbacks
**Time:** 5 minutes for architecture + implementation
**Result:** Scales to 1000+ users, handles server restarts gracefully

**The difference:** Sonnet got me to MVP. Opus got me to production-ready. That extra 3 minutes saved me a complete rewrite when users actually showed up.
```

# **Advanced Integration Setup (That I Love)**

## **Gmail Integration**

**Example prompt:**

```
Analyze my emails from the past 30 days:
- Which clients are most/least satisfied (tone analysis)
- What problems are multiple clients facing?
- Budget signals and expansion opportunities
- Technologies being requested more frequently

Format as actionable business intelligence.
```

Last month this analysis caught something crucial, 3 different newsletters mentioned a new python library. I was able to find this emerging trend, share it with the team and now use it.

The integration helped me realise I forgot to confirm my booking for my Sicily trip.

## **Calendar Integration**

```
**Developer-Specific Analysis:**
"Analyze my coding schedule patterns:
- When do I write my best code vs. just maintaining existing code?
- Which meeting types kill my programming flow?
- How much context switching is destroying my productivity?
- When should I batch admin tasks vs. deep work?"

**Discovery:** I code 3x better in the morning but do my best architecture thinking in the evening. Now I schedule code reviews and admin work for afternoons, protect morning flow state, and do system design after dinner.

**Result:** Went from context-switching chaos to optimized deep work blocks.
```

# Using N8N to go beyond code first to Results First

https://medium.com/vibe-coding/n8n-solved-my-integrations-and-saved-my-ideas-d36c580ae3f4

# How to use Claude Code

Docs : [https://docs.anthropic.com/en/docs/claude-code/overview](https://docs.anthropic.com/en/docs/claude-code/overview) 

https://docs.anthropic.com/en/home

**Use /clear to Reset Context**:

Use [**extended thinking mode**](https://console.anthropic.com/docs/concepts/extended-thinking) for architecture discussions

![image.png](AI%20Prompts%20for%20Engineering%2021df02c337d8802dbaddd0b4369621d3/image%203.png)

**Step 1: Setting Up Claude Code**

/init

| **Commands** | **Action**                                                  |
| ------------ | ----------------------------------------------------------- |
| /clear       | Clear conversation history and free up context              |
| /compact     | Clear conversation history but keep a summary in context    |
| /cost        | Show the total cost and duration of the current session     |
| /doctor      | Checks the health of your Claude Code installation          |
| /help        | Show help and available commands                            |
| /init        | Initialize a new CLAUDE.md file with codebase documentation |
| /bug         | Submit feedback about Claude Code                           |
| /review      | Review a pull request                                       |

CLAUDE.md

```
# Project Rules
- Always use `pnpm`
- Lint with `eslint --fix`
- Tests run via `pnpm test`
```

```
# Imports
@docs/API_GUIDELINES.md
@~/.claude/snippets.md
```

## Planning Mode

1. Press `Shift+Tab` twice.
2. Ask: *“Refactor all class components to functional ones, return a 3-step plan.”*
3. Review suggestions.
4. Exit Plan Mode, then execute.

## **Use XML Tags for Laser-Focused Prompts**

Claude is strangely obedient when you wrap your instructions in XML-like tags. It keeps your instructions clean, predictable, and less prone to hallucinations.

# **Example**

```
<task>
  <instructions>
    Refactor `userController.js` to use async/await.
  </instructions>
  <format>
    Output only a unified diff.
  </format>
  <constraints>
    Do not change unrelated code.
  </constraints>
</task>
```

 Add `@docs/*.md` inside the prompt if needed.

## **Custom Slash Commands = Instant Power Moves**

Tired of typing long prompts over and over? Add Markdown files to:

- `~/.claude/commands/` for personal use
- `.claude/commands/` inside a repo to share with your team

### **Example: `.claude/commands/audit.md`**

```
Audit the project for:
- SQL injection
- unsafe eval
- missing rate-limits on routes
```

```
Output a markdown table of findings.
```

Use /audit to invoke it

# **Hooks: Claude’s Secret Automation Layer**

Claude Code supports **PreToolUse**, **PostToolUse**, and other hooks. These are shell scripts that intercept Claude’s actions and let you run tests, validations, or Slack alerts *before* anything changes.

# **🧩 Example Hook: `.claude/hooks/pre-edit.sh`**

```
#!/bin/bash
payload=$(cat)
if echo "$payload" | grep -q ".env"; then
  echo "Edit blocked: Sensitive file"
  exit 1
fi
```

Use hooks to:

- Block secrets from being edited
- Run linters before commits
- Send alerts when big files change

![](https://miro.medium.com/v2/resize:fit:875/1*rXS68NEEE_Es3Fz-frCeFA.gif)

# **🧩 7. Demand Unified Diffs, Always**

Don’t let Claude give you full files unless you *want* a merge war. Tell it:

> “Make this change, but output only a unified diff.”

It’ll return `---`/`+++` patches you can apply directly with `git apply`.

# **🧪 Prompt Template:**

```
Update the login logic to use bcrypt.
Return ONLY a unified diff patch.
No prose or summaries.
```

Keep your changes focused and merge-friendly.

![](https://miro.medium.com/v2/resize:fit:560/1*2vqMhHkA_nB5Lkd4_AMo-w.gif)

# **🤖 8. Claude on PR Duty? Yes Please**

Claude Code integrates with GitHub via Actions. You can:

- Mention `@claude` in issues/PRs
- Ask it to generate code
- Let it open PRs automatically

This saves tons of time in code review cycles.

# **🪄 Sample PR Comment:**

```
@claude please refactor the cart logic to use reducer pattern.
Add tests and open a PR.
```

Magic ensues.

![](https://miro.medium.com/v2/resize:fit:875/1*Slb-d0HVWgzjSFZI5mRdxA.gif)

# **🧹 9. Clean Your Workspace Before Inviting Claude In**

Claude will read *everything* unless you tell it not to. Don’t be surprised when it starts commenting on `.DS_Store`.

# **👇 Ignore these early:**

```
node_modules/
coverage/
logs/
.env
*.sqlite
dist/
```

Also, structure your folders. Use a `docs/` folder for specs, `api/` for endpoints, etc. Claude respects order.

[https://www.anthropic.com/engineering/claude-code-best-practices](https://www.anthropic.com/engineering/claude-code-best-practices)

# **Create `CLAUDE.md` files**

`CLAUDE.md` is a special file that Claude automatically pulls into context when starting a conversation. This makes it an ideal place for documenting:

- Common bash commands
- Core files and utility functions
- Code style guidelines
- Testing instructions
- Repository etiquette (e.g., branch naming, merge vs. rebase, etc.)
- Developer environment setup (e.g., pyenv use, which compilers work)
- Any unexpected behaviors or warnings particular to the project
- Other information you want Claude to remember

You can place `CLAUDE.md` files in several locations:

- **The root of your repo**, or wherever you run `claude` from (the most common usage). Name it `CLAUDE.md` and check it into git so that you can share it across sessions and with your team (recommended), or name it `CLAUDE.local.md` and `.gitignore` it
- **Any parent of the directory** where you run `claude`. This is most useful for monorepos, where you might run `claude` from `root/foo`, and have `CLAUDE.md` files in both `root/CLAUDE.md` and `root/foo/CLAUDE.md`. Both of these will be pulled into context automatically
- **Any child of the directory** where you run `claude`. This is the inverse of the above, and in this case, Claude will pull in `CLAUDE.md` files on demand when you work with files in child directories
- **Your home folder** (`~/.claude/CLAUDE.md`), which applies it to all your *claude* sessions

## **Tune your `CLAUDE.md` files**

Your `CLAUDE.md` files become part of Claude’s prompts, so they should be refined like any frequently used prompt. A common mistake is adding extensive content without iterating on its effectiveness. Take time to experiment and determine what produces the best instruction following from the model.

You can add content to your `CLAUDE.md` manually or press the `#` key to give Claude an instruction that it will automatically incorporate into the relevant `CLAUDE.md`. Many engineers use `#` frequently to document commands, files, and style guidelines while coding, then include `CLAUDE.md` changes in commits so team members benefit as well.

At Anthropic, we occasionally run `CLAUDE.md` files through the [prompt improver](https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/prompt-improver) and often tune instructions (e.g. adding emphasis with "IMPORTANT" or "YOU MUST") to improve adherence.

[https://docs.anthropic.com/en/resources/prompt-library/library](https://docs.anthropic.com/en/resources/prompt-library/library)

[https://github.com/anthropics/prompt-eng-interactive-tutorial](https://github.com/anthropics/prompt-eng-interactive-tutorial)



