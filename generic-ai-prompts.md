# General AI Prompts


## Generic approach to prompts

## **Needed Components**

- **Role:** The role that the AI plays
- **Intention:** Summary of the functionality in reality to be produced. 
- **Context:** Current project context and constraints
  - **Environment** Environment in which the intention must be delivered (e.g. tech stack)
  - **Constraints** Limitations that govern the implementation of the intention
  - **Audience** The consumer of the outcome 
- **Specific Measurable Results:** What success looks like 

_Example_

```markdown

# Role 

You are an experienced 

# Intention

# Context

## Environment

## Constraints

## Audience

# Specific Measurable Results


```


**Example prompt:**

```
**Generic Developer Prompt:**
"Help me choose between GraphQL and REST for my API"

**SCALE Framework Applied:**
SITUATION: Building API for my SaaS side project, need to ship MVP in 3 weeks
CONTEXT: React frontend, Node.js backend, PostgreSQL, will have mobile app later
AUDIENCE: Frontend team of 1 (me), will hire junior dev in 6 months
LIMITATIONS: Can't spend weeks learning GraphQL, need something maintainable by juniors
EXPECTED OUTCOME: Fast development now, easy to scale team later, mobile-friendly

**Claude's Response Quality:**
- Generic: "Here are the pros/cons of each..."
- SCALE: "For your situation, use REST with OpenAPI specs. Here's why: faster MVP delivery, junior dev friendly, and here's the exact folder structure and patterns to use..."

**Time Saved:** 2 days of research → 20 minutes of targeted advice
```



## Ask LLM to create a Prompt 

```markdown
I need your expertise to write a highly effective prompt.  
My goal is to have another LLM generate:  
**<clear, direct objective here>**

---

## Key elements to include or consider:

### 1. Top-Level Condition 1
Brief description if needed.

### 2. Top-Level Condition 2
Brief description if needed.

### 3. Top-Level Condition 3
Description if needed.
- Subcondition 3.1
- Subcondition 3.2

### 4. Top-Level Condition 4  
Must include explicit example(s) in one of the following formats:
- XML
- YAML
- JSON
- Plain Text

Provide structure or example if applicable:
```yaml
example:
  key: value
  
  
Before you draft the prompt, ask me any clarifying questions you have. I want to ensure we cover all angles so the final prompt is comprehensive.  
```

# References

https://medium.com/vibe-coding/these-premium-leaked-startup-prompts-became-my-secret-weapon-92aa4e9cde2f : https://github.com/x1xhlol/system-prompts-and-models-of-ai-tools

[https://github.com/x1xhlol/system-prompts-and-models-of-ai-tool](https://github.com/x1xhlol/system-prompts-and-models-of-ai-tool)



## Use Context 7 to supply technology stack info

https://context7.com/

https://medium.com/@joe.njenga/these-9-mcp-servers-improve-ai-context-reduce-99-code-errors-d2ba7acd9d94

## Engineering MCPs

**Knowledge Graph Memory Server: [Knowledge Graph Memory Server](https://github.com/shaneholloman/mcp-knowledge-graph)**

https://medium.com/@joe.njenga/these-9-mcp-servers-improve-ai-context-reduce-99-code-errors-d2ba7acd9d94

https://medium.com/@joe.njenga/i-found-these-agentic-mcp-servers-repos-that-you-dont-know-exist-709207b80447

Code Token Tracking : [https://github.com/oraios/serena?tab=readme-ov-file#what-can-i-use-serena-for](https://github.com/oraios/serena?tab=readme-ov-file#what-can-i-use-serena-for) 


**Zen MCP** https://github.com/BeehiveInnovations/zen-mcp-server
