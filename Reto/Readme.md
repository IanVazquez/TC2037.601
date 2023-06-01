# Syntax Highlighter

| By                                     | Created on       |
|----------------------------------------|------------------|
| **Ian Luis Vázquez Moran \| A01027225** | **5/31/2023**    |
| **Domingo Mora Pérez \| A01783317**      |                  |

## Reflection on Solution and Algorithms

In this project, we implemented a lexical analyzer in Python using regular expressions. The goal was to read a source code file and identify the different lexical categories present in the code.

We chose Python as the programming language for this project because of its familiar syntax and built-in support for regular expressions. Regular expressions provided a simple and efficient way to match and extract the lexical elements from the source code.

The main algorithm of the program involves reading the source code file line by line and splitting each line into words. We then apply various regular expressions to identify and format the different lexical categories such as functions, reserved words, arithmetic operators, and comparative operators. The formatted words are then joined back together to create the HTML content.

The complexity of the algorithm is determined by the number of lines and words in the source code file. Let's assume the source code file has *n* lines and *m* words. The algorithm reads each line and applies regular expressions to each word, resulting in a total of *n * m* iterations. Therefore, the complexity can be approximated as *O(n * m)*.

## Execution Time and Complexity

The execution time of the program will depend on the size of the source code file and the number of lexical elements it contains. As mentioned earlier, the complexity of the algorithm is *O(n * m)*, where *n* is the number of lines and *m* is the average number of words per line.

To estimate the execution time, we need to consider the size of the source code file and the efficiency of the regular expressions used. In general, regular expressions can have varying performance characteristics depending on the complexity of the pattern and the input being matched.

It's important to note that the execution time may also be affected by factors such as the processing power of the machine running the program and any other concurrent tasks.

![Complexity O(n * m)](https://www.lancaster.ac.uk/stor-i-student-sites/lidia-andre/wp-content/uploads/sites/22/2021/04/1_KfZYFUT2OKfjekJlCeYvuQ.jpeg)

## Conclusion

In this project, we developed a lexical analyzer in Python using regular expressions. The program reads a source code file, identifies lexical categories such as functions, reserved words, and operators, and generates an HTML file with highlighted lexical elements.

The use of regular expressions allowed us to efficiently match and extract the lexical elements from the source code. However, the complexity of the algorithm is determined by the number of lines and words in the source code file, resulting in a potential increase in execution time for larger files.

It's important to note that the estimated complexity and execution time are based on the assumptions made about the input size and the efficiency of the regular expressions used. Real-world performance may vary depending on the specific characteristics of the source code and the machine running the program.

## Ethical Implications

The development and use of technology like lexical analyzers have ethical implications that need to be considered. While a lexical analyzer itself may not have direct ethical implications, it is part of the broader field of code analysis and understanding.

One potential ethical consideration is the privacy and security of the source code being analyzed. If the source code contains sensitive or proprietary information, there is a need to ensure that appropriate measures are in place to protect that information.

Another ethical consideration is the potential misuse of lexical analyzers for malicious purposes. For example, an attacker could use a lexical analyzer to identify vulnerabilities or extract sensitive information from a codebase. It is important to use such tools responsibly and in accordance with ethical guidelines.

Furthermore, the development and use of lexical analyzers can contribute to the accessibility and understandability of code. By providing visual representations of the code's lexical elements, these tools can assist developers in comprehending and maintaining codebases. This can have a positive impact on code quality and collaboration within development teams.

In conclusion, while the specific implementation of a lexical analyzer may not have direct ethical implications, it is essential to consider broader ethical considerations related to privacy, security, and responsible use of such tools in the context of code analysis and understanding.


## **References**
1. Friedl, J. E. (2006). *Mastering Regular Expressions* (3rd ed.). O'Reilly Media.

