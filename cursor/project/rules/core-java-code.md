# Java Coding Rules

Goal: Consistent, safe, readable Java. Favor clarity over cleverness. 

## Design

- Prefer composition over inheritance unless inheritance is required.
- Apply SOLID principles when designing classes and interfaces
- Always include visibility modifiers (public/private/protected) explicitly.
- Avoid mutable static state unless strictly necessary.
- Prefer immutability: use final for fields, variables, and parameters where possible.
- Follow clean architecture principles: separate domain, application, infrastructure concerns.
- One top-level public type per file. Keep classes focused; avoid “utility god” classes.

## Naming

- Use descriptive names: classes (PascalCase), methods/variables (camelCase), constants (UPPER_SNAKE_CASE).
- 

## General Java Idioms

- Document public APIs with Javadoc. Keep comments high-level (why, not what).
- Code should compile without warnings under -Xlint:all.
- Keep methods short and focused (generally <30 LOC).
- Avoid cyclic dependencies between packages.
- Write unit tests for all non-trivial logic.
- Prefer Operating Result pattern over using exceptions 

### Logging

- ERROR level should be used sparingly. Used when the application cannot continue. Users are being affected.
- WARNING level should be used when something notable has happened but the application still has the chance to complete the business case
- INFO level is used to document state changes in the application or entities within the application e.g. such as changes in state change of the app 
- DEBUG level Is used to present any information that will help us identify what went wrong
    
## JDK Idioms

- Use JDK 21 unless project explicitly requires older versions.
- Use Lombok for boilerplate code unless JDK provides replacement features.
- Use @Slf4j for logging.

### JDK 8

- Use Optional instead of returning null from methods.
- Prefer streams and lambdas for collection processing, but avoid overcomplicating.
- Always close resources (use try-with-resources).

### JDK 11

- Use `var` use for obvious initializers (builders, optionals, streams); avoid where it obscures types
- Use String.isBlank, lines, strip, repeat for common string tasks
- Use Factory methods: List.of(...), Map.of(...) for small immutable collections

### JDK 17

- Use records (equals/hashCode/toString/immutability for free) for DTOs/Value Objects. This replaces @Value/@Data purely for DTOs 
- Use closed polymorphic taxonomies (sealed interface Shape permits Circle, Rectangle)
- Use Pattern Matching for instanceof + binding
- Use switch expressions (expression form with yield or arrow)
- Use text blocks for JSON/SQL.
  
### JDK 21

- For concurrency, prefer structured concurrency or java.util.concurrent utilities over manual threads.
- Use switch with patterns




