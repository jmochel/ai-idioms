---
name: Java Unit Test Guidelines
description: Comprehensive standards and best practices for writing Java unit tests.
language: Java
tags:
  - testing
  - guidelines
  - java
---

## Java  Standards

- Operatng result
- 

0. **General Structure** 
   - Use project lombok
   - Use @SLf4j for crteating loggers

1. **Test Naming**  
   - Use BDD naming style `when<Event>Then<ExpectedBehavior>`  or `given<StartingCondition>When<event>Then<ExpectedBehavior>` 
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

2. **Individual Test Structure**  
   - Follow AAA (Arrange, Act, Assert) pattern.
   - Keep one **logical** assertion per test (may involve something like  ).
   - Tests should be straightforward and avoid complex control flow (loops, if/else statements) within the test method itself.
   - Refactor complex test logic into helper methods or utilize parameterized tests if needed.
  
3. **Effective Assertions**
   - Use JUnit 5's Assertions class for clear and concise assertions.
   - Utilize assertThrows for testing exception scenarios.
   - Use `Assertions.assetAll(...);` for grouping multiple assertions within a single test.
   - Use third-party assertion libraries like AssertJ for adding meaningful assertions for complicated states in aggregates 

4. **Isolate Tests and Minimize Dependencies** 
    - Each test should be independent and not rely on the order of execution of other tests.  
    - Use test doubles (mocks, stubs, fakes) to isolate the unit under test from external dependencies like databases, APIs, or complex objects.
    - Avoid over-mocking; mock only necessary dependencies to keep tests focused and avoid testing implementation details.

5. **Frameworks & Tools**  
   - Use JUnit 5.
   - Use Mockito for mocking external dependencies only.
   
6. **Coverage**  
   - Minimum: 80% per class.
   - Include edge cases and failure paths.


5. **Parameterized Tests**
   - Employ @ParameterizedTest with sources like @ValueSource, @CsvSource, or @MethodSource to test various input scenarios efficiently and reduce code duplication.
  
Consider using JUnit 5 extensions for advanced test customization and lifecycle management.

1. Fast and Isolated Execution:
Ensure tests run quickly and do not rely on external resources that can slow down execution or introduce flakiness.
1.  Maintain and Refactor Tests:
As your codebase evolves, update and refactor tests to reflect changes in the application logic.
Regularly review and improve test quality to ensure they remain relevant and effective.


Consider

When to mock
When to spy
When to fake
When to use @TestInstance(TestInstance.Lifecycle)
When to use @Nested
When to use Assumptions API ?
   assumeFalse(): Validates whether the given assumption is False or not
   assumeTrue(): Validates whether the given assumption is True or not
   assumingThat(assumption,executable)
Test class file name ClassName along with Test
Test class file name ClassName along with Test

When to use @BeforeEach, @BeforeAll, @AfterAll, @AfterEach 

When to use grouped assertions

When to use @ParameterizedTest
Prefer assertThrows over try-catch
Test both happy paths and edge cases
'
the package of the test class should match the package of the source class whose unit of source code it’ll test.

How to name assertEquals("Geaorge","Reginald", "First Name");

assertAll("Cache support", 
   () -> assertEquals()assertEquals("Geaorge","Reginald", "First Name")
);

Therefore, we should mock the external services and merely test the logic and execution of our code for varying scenarios.

Create more and more helper functions to generate the commonly used objects and mock the data or external services for similar unit tests.

Don't test getters or setters (unless......)

Wreite the code as DIable

Do not use Randomized data 

When to use Helper functions and for what ?
??
Use helper functions for creating data (objects) (createProductWithCategory()) and complex assertions. Only pass those parameters to the helper functions that are relevant for your tests. Use reasonable defaults for the other values. In Kotlin, this is easy by using default arguments. In Java, you have to use method chaining and overloading to simulate default arguments.
??


?? When to use magic numbers (KISS > DRY
)
    insertIntoDatabase(
            createProductWithCategory("4243", "Office"),
            createProductWithCategory("1123", "Office"),
            createProductWithCategory("9213", "Hardware")
    );
    ??

One bigger “mapping test” that assert all values from the database are correctly returned in the JSON payload and got mapped correctly to the correct format. We can do this easily by using AssertJ’s isEqualTo() (for a single element) or containsOnly() (for multiple elements) if you have implemented equals() correctly.

Some tests checking corner cases or special business logic. For instance, if a certain value in the payload is calculated correctly. In this case, we may only be interested in a certain JSON field of the payload. So we should only check the relevant field to clearly state and document the scope of the logic under test. Again, there is no need to assert all fields again, because there are not relevant here.
assertThat(actualProduct.getPrice()).isEqualTo(100);

Favor Composition Over Inheritance
Don’t build up complex inheritance hierarchies for the test classes.


?? @Nested via use cases?
JUnit5’s @Nested is useful to group tests methods. Reasonable groups can be certain types of tests (like InputIsXY, ErrorCases) or one group for each method under test (GetDesign and UpdateDesign).


Use Awaitility for Asserting Asynchronous Code

Don’t Use Static Access. Never. Ever.

Parameterize
Make all relevant parts of the class controllable by the test. This can be done by making a parameter for the constructor out of this aspect.

For instance, your DAO has a fixed limit of 1000 for queries. Testing this limit would require you to create 1001 database entries in the test. By using a constructor parameter for this limit you make the limit configurable. In production, this parameter is 1000. In the test, you can use 2. This only requires 3 test entries for testing the limit feature


Use Constructor Injection
Field injection is evil due to poor testability. You have to bootstrap the DI environment in your tests or do hacky reflection magic. So constructor injection is the preferred way because it allows you to easily control the dependent object in the test.

Don’t Use Instant.now() or new Date()
Don’t get the current timestamp by calling Instant.now() or new Date() in your production code when you like to test this behavior.
Instead:

public class ProductDAO {
    private Clock clock; 

    public ProductDAO(Clock clock) {
        this.clock = clock;
    }

    public void updateProductState(String productId, State state) {
        Instant now = clock.instant();
        // ...
    }
}


In the test, you can now create a mock for the clock, pass it to the ProductDAO and configure the clock mock to return a fixed timestamp. After calling updateProductState() we assert if the defined timestamp made it into the database.

https://phauer.com/2019/modern-best-practices-testing-java/

Separate Asynchronous Execution and Actual Logic
Testing asynchronous code is tricky. Libraries like Awaitility can help, but it’s still cumbersome and test can still toggle. If possible, it makes sense to separate the (often synchronous) business logic from the asynchronous execution of this logic.

For instance, by putting the business logic in the ProductController, we can test it synchronously which is easy. The asynchronous and parallelization logic is centralized in the ProductScheduler, which can be tested in isolation.
