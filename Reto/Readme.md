# Syntax Highlighter

| By                                     | Created on       |
|----------------------------------------|------------------|
| **Ian Luis Vázquez Moran \| A01027225** | **6/16/2023**    |
| **Domingo Mora Pérez \| A01783317**      |                  |

## How can i run it?

**Sequential Execution:**

To run the program sequentially, use the following function in Elixir:
*File.create_html_file()*
This will process the python files sequentially, one by one.

**Parallel Execution:**

To run the program in parallel, use the function File.create_html_file(cores), where cores is the number of cores you want to use. Make sure cores is an integer greater than 0.

*File.create_html_file(4)* (Run in parallel with 4 cores)

This will process the python files in parallel using the specified number of cores.

## **It is very important to have the Python files in the same directory as the Elixir file for the program to work correctly.**


In this project, we implemented a lexical analyzer in Python using regular expressions. The goal was to read a source code file and identify the different lexical categories present in the code.

We chose Python as the programming language for this project because of its familiar syntax and built-in support for regular expressions. Regular expressions provided a simple and efficient way to match and extract the lexical elements from the source code.

The main algorithm of the program involves reading the source code file line by line and splitting each line into words. We then apply various regular expressions to identify and format the different lexical categories such as functions, reserved words, arithmetic operators, and comparative operators. The formatted words are then joined back together to create the HTML content.

The complexity of the algorithm is determined by the number of lines and words in the source code file. Let's assume the source code file has n lines and m words. The algorithm reads each line and applies regular expressions to each word, resulting in a total of n * m iterations. Therefore, the complexity can be approximated as O(n * m).

The execution time of the program will depend on the size of the source code file and the number of lexical elements it contains. As mentioned earlier, the complexity of the algorithm is O(n * m), where n is the number of lines and m is the average number of words per line.

To estimate the execution time, we need to consider the size of the source code file and the efficiency of the regular expressions used. In general, regular expressions can have varying performance characteristics depending on the complexity of the pattern and the input being matched.

It's important to note that the execution time may also be affected by factors such as the processing power of the machine running the program and any other concurrent tasks.

# Performance Test Results:

The execution time of the create_html_file/1 function with different numbers of cores is as follows:

1. With 1 core: 0.313139 s
2. With 2 cores: 0.345907 s
3. With 3 cores: 0.353791 s
4. With 4 cores: 0.341401 s
5. With 5 cores: 0.330751 s
6. With 6 cores: 0.353177 s
7. With 7 cores: 0.345395 s
8. With 8 cores: 0.311398 s
# Reflection on Performance and Execution Time:

Analyzing the results of the performance tests, we observe that the execution time decreases as the number of cores increases. Particularly, with 8 cores, a significantly lower execution time (0.311398 s) is achieved compared to the sequential version. This demonstrates the benefits of utilizing parallelism and leveraging multiple cores.

The reduction in execution time when adding more cores suggests that parallel processing effectively distributes the workload and improves performance. It is likely that beyond 8 cores, the benefits of parallel execution will continue, making it more advantageous than the sequential approach, especially when dealing with a larger number of files.

The complexity of the algorithm remains the same regardless of the number of cores used. However, the parallel implementation introduces additional complexity due to task management and synchronization. In this specific case, given the relatively small size of the Python files and low workload, the overhead associated with task creation and management may offset the benefits of parallelism.

# Conclusion:

In conclusion, the parallel version of the create_html_file/1 function demonstrates improved performance with the use of multiple cores. The sequential version may be more efficient in scenarios with fewer files and a low workload, but the parallel approach proves beneficial when dealing with a larger number of files and a more intensive workload.

# Considerations

It's important to note that the estimated complexity and execution time for the lexical analyzer are based on the assumptions made about the input size and the efficiency of the regular expressions used. Real-world performance may vary depending on the specific characteristics of the source code and the machine running the program.

The development and use of technology like lexical analyzers have ethical implications that need to be considered. While a lexical analyzer itself may not have direct ethical implications, it is part of the broader field of code analysis and understanding.

One potential ethical consideration is the privacy and security of the source code being analyzed. If the source code contains sensitive or proprietary information, there is a need to ensure that appropriate measures are in place to protect that information.

Another ethical consideration is the potential misuse of lexical analyzers for malicious purposes. For example, an attacker could use a lexical analyzer to identify vulnerabilities or extract sensitive information from a codebase. It is important to use such tools responsibly and in accordance with ethical guidelines.

Furthermore, the development and use of lexical analyzers can contribute to the accessibility and understandability of code. By providing visual representations of the code's lexical elements, these tools can assist developers in comprehending and maintaining codebases. This can have a positive impact on code quality and collaboration within development teams.

In conclusion, while the specific implementation of a lexical analyzer may not have direct ethical implications, it is essential to consider broader ethical considerations related to privacy, security, and responsible use of such tools in the context of code analysis and understanding.


## **References**

1. Friedl, J. E. (2006). *Mastering Regular Expressions* (3rd ed.). O'Reilly Media.
