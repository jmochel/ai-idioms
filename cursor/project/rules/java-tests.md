---
name: Java Unit Test Guidelines
description: Comprehensive standards and best practices for writing Java unit tests.
language: Java
tags:
  - testing
  - guidelines
  - java
  - junit
---

- Naming
   - Use BDD naming style `when<Event>Then<ExpectedBehavior>`  or `given<StartingCondition>When<Event>Then<ExpectedBehavior>` 
   - Example: `whenRegistrationCanceledThenCreditCardDataIsRemovedFromCache` or `givenCompleteRegistrationWhen7DaysBeforeCourseThenParticipantIsEmailedNotification`
   - Use `@DisplayNameGeneration(ReplaceBDDCamelCase.class)` referring to a DisplayNameClassGenerator like 
   - ```java
        package <project-package>.fixture

        import org.junit.jupiter.api.DisplayNameGenerator;

        import java.lang.reflect.Method;

        /**
        * JUnit 5 Test Display Name generator
        * <p>
        * Does several things to transform test method names to test names.
        * <ol>
        *  <li>Separates camel case names with spaces</li>
        *  <li>Replace BDD key words with all caps versions. i.e. 'GIVEN','WHEN','THEN'. 'given' Is only uppercase when
        *  it is the first word of the test method name </li>
        * </ol>
        * <p>
        * Does several things to transform nested class names to test scenario names.
        * <ol>
        *  <li>Removes 'Test' from the end of class </li>
        *  <li>Separates camel case names with spaces</li>
        *  <li>Replace BDD key words with all caps versions. i.e. 'AND','GIVEN','WHEN','THEN'. 'given' and 'and' are only uppercased
        *  when they are the first word in the name of the class.</li>
        * </ol>
        */
        public class ReplaceBDDCamelCase extends DisplayNameGenerator.Standard
        {
            @Override
            public String generateDisplayNameForClass(Class<?> testClass) {

                return splitCamelCase(testClass.getSimpleName().replaceAll("[Tt]est$",""));
            }

            @Override
            public String generateDisplayNameForNestedClass(Class<?> nestedClass) {

                var nestedClassDisplayName = splitCamelCase(nestedClass.getSimpleName().replaceAll("[Tt]est$",""))
                        .toLowerCase()
                        .replaceAll("^and", "AND ")
                        .replaceAll("^given", "GIVEN ")
                        .replaceAll(" when ", "WHEN ")
                        .replaceAll(" then ", " THEN ")
                        .replaceAll("  ", " ")
                        .trim();

            return nestedClassDisplayName;          
            }

            @Override
            public String generateDisplayNameForMethod(Class<?> testClass, Method testMethod) {
                var methodDisplayName =  splitCamelCase(testMethod.getName())
                        .toLowerCase()
                        .replaceAll("^given", "GIVEN ")
                        .replaceAll("when ", "WHEN ")
                        .replaceAll(" then ", " THEN ")
                        .replaceAll("  ", " ")
                        .trim();

                return methodDisplayName;
            }

            private String splitCamelCase(String incoming)
            {
                return incoming.replaceAll("([A-Z][a-z]+)", " $1")
                            .replaceAll("([A-Z][A-Z]+)", " $1")
                            .replaceAll("([A-Z][a-z]+)", "$1 ")
                            .trim();
            }
        }
   ```

-- Individual Test Structure
   - Follow AAA (Arrange, Act, Assert) pattern.
   - Each test should be independent and not rely on the order of execution of other tests.  
   - Use test doubles (mocks, stubs, fakes) to isolate the unit under test from external dependencies like databases, APIs
   - Avoid over-mocking; mock only necessary dependencies to keep tests focused and avoid testing implementation details.

- Effective Assertions
   - Use JUnit 5's Assertions class for clear and concise assertions.
   - Utilize assertThrows for testing exception scenarios.
   - Use `Assertions.assetAll(...);` for grouping multiple assertions within a single test.
   - Use third-party assertion libraries like AssertJ for adding meaningful assertions for complicated states in aggregates 

- Frameworks & Tools
   - Use JUnit 5
   - Utilize annotations like @BeforeEach, @AfterEach, @Nested, and @Tag for setting up and tearing down test environments, organizing tests, and selective execution.
   - Consider using JUnit 5 extensions for advanced test customization and lifecycle management.
   - Use Mockito for mocking external dependencies only.

- Coverage
   - Minimum: 80% per class.
   - Include edge cases and failure paths.

- Parameterized Tests
   - Employ @ParameterizedTest with sources like @ValueSource, @CsvSource, or @MethodSource to test various input scenarios efficiently and reduce code duplication.
  
- Avoid Logic in Tests
   - Tests should be straightforward and avoid complex control flow (loops, if/else statements) within the test method itself.
   - Refactor complex test logic into helper methods or utilize parameterized tests if needed.
   - 
- Fast and Isolated Execution
   - Ensure tests run quickly and do not rely on external resources that can slow down execution or introduce flakiness.

- Maintain and Refactor Tests
   - As your codebase evolves, update and refactor tests to reflect changes in the application logic.
   - Regularly review and improve test quality to ensure they remain relevant and effective.


