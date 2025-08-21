# AI Crafts Prompt



# Q&A Prompt Strategy

When you know the desired result, but you want to avoid assumptions that might lead to incorrect solutions

Source [4-must-know-ai-prompt-strategies-for-developers](https://reykario.medium.com/4-must-know-ai-prompt-strategies-for-developers-0572e85a0730) 

## Approach 

1. Present your initial problem or request specifying that the AI must ask questions about specific requirements and constraints 
2. AI asks relevant questions to clarify requirements
3. You provide additional details based on these questions
4. The AI uses this enhanced context to deliver a more tailored solution

## Template 

```
I need to build [your result here]. 
Before providing a solution, please ask me relevant questions about my specific requirements and constraints so you can give me the most appropriate implementation advice.
```

# Pros and Cons Prompt Strategy

When you are looking for a assessment of both approaches for a specific situation. 

Forces consideration of potential downsides and provides a structured comparison framework tailored to the particular situation.

Source [4-must-know-ai-prompt-strategies-for-developers](https://reykario.medium.com/4-must-know-ai-prompt-strategies-for-developers-0572e85a0730) 

## Approach

1. Present a decision point or choice between multiple options
2. Explicitly ask the AI to analyze each option’s strengths and weaknesses
3. AI provides a balanced assessment of each option
4. You gain a clearer understanding of tradeoffs to make better decisions

## Example

```
I’m developing a product catalog application that needs to store product information, images, and customer reviews. Please analyze the pros and cons of using MongoDB, PostgreSQL, and Firebase for this application. Consider factors like scalability, query capabilities, ease of development, and maintenance requirements.
```

# Stepwise Chain of Thought Prompt Strategy

When the tasks that is being approached is large such as as a large scale refractory and you don't want the AI to go off into strange corners


Source [4-must-know-ai-prompt-strategies-for-developers](https://reykario.medium.com/4-must-know-ai-prompt-strategies-for-developers-0572e85a0730) 

## Approach

1. Instruct the AI to solve a problem by breaking it into distinct steps
2. AI completes only one step, then stops and waits for your approval
3. Review the step and provide feedback or confirmation
4. After your confirmation does the AI proceed to the next step
5. This continues until the entire problem is solved

## Example

```
Help me refactor the code in service.js. Go one step at a time. Do not move to the next step until I give the keyword ‘next’.
```


# Role Prompt Strategy

Focuses responses toward specific domain expertise. By specifying a particular role for the AI to take on you force it away from more balanced approaches

Source [4-must-know-ai-prompt-strategies-for-developers](https://reykario.medium.com/4-must-know-ai-prompt-strategies-for-developers-0572e85a0730) 

## Approach

1. You ask the AI to assume a specific professional role or expertise
2. You describe the context and questions you have for that role
3. The AI responds with the mindset, knowledge, and perspective of that specialist
4. You get advice that reflects that role’s priorities and expertise

## Example

```
Instead of “Review this authentication code for my web app” use


“Act as a senior security engineer with 10 years of experience in web application security. Review the following authentication code for my React application and identify any security vulnerabilities, potential edge cases, or implementation flaws. Be particularly attentive to common OWASP security risks.”
```

# Role and Q&A strategy combined

Good for dealing with areas that are outside your expertise

Source [4-must-know-ai-prompt-strategies-for-developers](https://reykario.medium.com/4-must-know-ai-prompt-strategies-for-developers-0572e85a0730) 

## Example

```
“Act as a DevOps engineer with expertise in Kubernetes. I need help setting up a CI/CD pipeline for our microservices architecture. Before providing a solution, please ask me questions about our current infrastructure, team capabilities, and specific requirements to ensure your guidance is tailored to our situation.”
```

# Stepwise + Pros and Cons Strategy

Allows for step blinds refinement with careful consideration at each decision point

Source [4-must-know-ai-prompt-strategies-for-developers](https://reykario.medium.com/4-must-know-ai-prompt-strategies-for-developers-0572e85a0730) 

## Example

```
“I need to migrate our application from a monolithic architecture to microservices. Let’s approach this one step at a time, and for each step, I’d like you to present multiple approaches with their pros and cons. First, help me identify which components should be separated into microservices. Don’t proceed to the next step until I type ‘next’.”
```

# Role + Stepwise Strategy

Create a person of a specific role for paired programming

Source [4-must-know-ai-prompt-strategies-for-developers](https://reykario.medium.com/4-must-know-ai-prompt-strategies-for-developers-0572e85a0730) 

## Example

```
Act as a senior database architect. I need to optimize our PostgreSQL database that’s experiencing performance issues with our e-commerce application. Walk me through the optimization process step by step, explaining your reasoning at each stage. Wait for my confirmation before moving to the next step.
```

# Q&A + Pros and Cons + Stepwise Strategy

The “big decision” pattern. It takes longer but is the thorough approach for high-stakes technical choices

Source [4-must-know-ai-prompt-strategies-for-developers](https://reykario.medium.com/4-must-know-ai-prompt-strategies-for-developers-0572e85a0730) 

## Example

```
I’m designing a real-time data processing system for IoT devices. First, please ask me clarifying questions about our requirements and constraints. Then, present the pros and cons of different architectural approaches (Kafka vs. RabbitMQ, serverless vs. container-based, etc.). Finally, once we’ve settled on an approach, guide me through the implementation step by step, waiting for my confirmation at each stage
```


