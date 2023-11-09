# Testing AI Language Models for Code Creation
## A Very Brief Primer On AI
### The Stakes
- [VP Kamala Harris Holds Roundtable On Artificial Intelligence [YouTube]](https://www.youtube.com/watch?v=S5MW2aRc4ac&t=183s)  
Key point: What goes into "the machine" will determine what comes out.
- [Why Hal 9000 Went insane [YouTube]](https://www.youtube.com/watch?v=dsDI4SxFFck&t=122s)  
What can happen if a machine is "incorrectly taught."

### What Is An LLM, and Where Do They Come From?
The center of most AIs used today is the large language model (LLM). 
- [What are Large Language Models](https://machinelearningmastery.com/what-are-large-language-models/)  
A high-level description of large language models (LLMs) and how they work.
- [Google "We Have No Moat, And Neither Does OpenAI"](https://www.semianalysis.com/p/google-we-have-no-moat-and-neither)  
A leaked internal Google document written by an engineer about the current sources of AI development. He hypothesises that the open source community, not Google, OpenAI, or other large entities, will be/are the spearhead in AI.

## Testing Coding LLMs
Testing AI LLMs designed to write code involves evaluating their performance on a range of tasks that assess their ability to generate correct and efficient code. Here is a list of tests to consider:

1. **Correctness Tests**:
   - [**Unit Tests**](01-unit.md): Evaluate the LLM's ability to generate code that produces correct outputs for specific inputs.
   - [**Integration Tests**](01-integration.md): Assess the LLM's capability to generate code that works seamlessly within a larger system or program.
   - [**Edge Cases**](01-edge.md): Test the LLM's handling of uncommon or extreme inputs that might lead to errors or unexpected behavior.

2. **Performance Tests**:
   - [**Efficiency and Speed**](02-efficency_speed.md): Evaluate the generated code for its runtime efficiency and execution speed.
   - [**Resource Usage**](02-resource.md): Assess the LLM's ability to generate code that efficiently uses system resources like memory and CPU.

3. **Code Quality and Style Tests**:
   - [**Code Readability**](03-readability.md): Evaluate how well the generated code adheres to established coding standards and conventions.
   - [**Code Structure**](03-structure.md): Check if the generated code follows good practices for modularity, maintainability, and organization.

4. **Generalization Tests**:
   - [**General Programming Tasks**](04-general_programming.md): Assess the LLM's ability to perform a wide range of programming tasks, covering different programming paradigms (e.g., procedural, object-oriented, functional).
   - [**Algorithms and Data Structures**](04-algorithms.md): Evaluate the LLM's proficiency in generating code for common algorithms and data structures.

5. **Domain-Specific Tests**:
   - [**Web Development**](05-web_development.md): Assess the LLM's ability to generate HTML, CSS, JavaScript, or backend code for web applications.
   - [**Machine Learning and Data Science**](05-machine_learning.md): Test the LLM's proficiency in generating code for tasks like data preprocessing, model training, and evaluation.
   - [**System Administration and DevOps**](05-system_administration.md): Evaluate the LLM's capability to generate code for tasks related to server configuration, deployment, and automation.

6. **Error Handling Tests**:
   - [**Graceful Degradation**](06-graceful_degradation.md): Evaluate how well the LLM handles and recovers from errors or exceptions in the generated code.
   - [**Error Messages**](06-error_messages.md): Assess the clarity and usefulness of error messages produced by the generated code.

7. **Security Tests**:
   - [**Input Validation**](07-input_validation.md): Evaluate the LLM's ability to generate code that properly validates user inputs to prevent security vulnerabilities like SQL injection or cross-site scripting (XSS).
   - [**Access Control**](07-access_control.md): Check if the generated code implements appropriate access controls to protect sensitive information.

8. **Scalability Tests**:
   - [**Handling Large Datasets**](08-handling_datasets.md): Evaluate the LLM's ability to generate code that efficiently processes or analyzes large volumes of data.
   - [**Load Handling**](08-load_handling.md): Assess how well the generated code handles high loads or concurrent requests.

9. **Adversarial Tests**:
   - [**Input Perturbations**](09-input_perturbations.md): Test the LLM's robustness to small changes in input, to ensure it doesn't produce incorrect or unexpected behavior.
   - [**Security Vulnerabilities**](09-security_vulnerabilities.md): Assess the LLM's susceptibility to adversarial attacks aimed at exploiting vulnerabilities in the generated code.

10. **Feedback Loop Tests**:
    - [**Feedback Incorporation**](10-feedback_incorporation.md): Evaluate how well the LLM can incorporate feedback on generated code to improve its performance over time.

Remember to curate a diverse set of tests that cover a wide range of scenarios and use cases to get a comprehensive assessment of the LLM's capabilities. Additionally, consider using real-world projects or applications as a benchmark for evaluating the LLM's code-writing abilities.
