En este código de Markdown, tengo este Readme:

| By                                     | Created on   |
|----------------------------------------|--------------|
| **Ian Luis Vázquez Moran \| A01027225** | **6/14/2023**|
| **Domingo Mora Pérez \| A01783317**     |              |

# Time Analysis

For the `sum_primes` function (sequential calculation), the execution time varied depending on the problem size.

- For the range of numbers up to 500, it took approximately 2.04e-4 seconds (0.000204 seconds).
- For the range of numbers up to 10,000, it took approximately 0.009011 seconds.
- For the range of numbers up to 1,000,000, it took approximately 3.505766 seconds.

For the `sum_primes_parallel` function (parallel calculation using concurrency), the execution time also varied depending on the problem size and the core configuration.

- For the range of numbers up to 500, there was no significant improvement in performance compared to the sequential version.
- For the range of numbers up to 10,000, the execution time was approximately 0.003481 seconds using 8 cores.
- For the range of numbers up to 1,000,000, the execution time was approximately 0.779366 seconds using 8 cores.

## Time Analysis Conclusion

The time analysis results show that the execution time of the `sum_primes` function increases as the problem size (range of numbers) increases. However, for the `sum_primes_parallel` function, there is no significant improvement in performance for the range of numbers up to 500.

For larger problem sizes, the `sum_primes_parallel` function outperforms the sequential version. The execution time significantly decreases for the range of numbers up to 10,000 and 1,000,000 when using 8 cores for parallel calculation.

## Speedup Analysis

Speedup is calculated as the ratio between the sequential execution time and the parallel execution time. A speedup greater than 1 indicates an improvement in performance through the use of concurrency and parallelism.

- For the range of numbers up to 10,000, the speedup obtained using 8 cores was approximately 2.58 (0.009011 seconds / 0.003481 seconds). This means that the parallel calculation was approximately 2.58 times faster than the sequential calculation in this configuration.
- For the range of numbers up to 1,000,000, the speedup obtained using 8 cores was approximately 4.5 (3.505766 seconds / 0.779366 seconds). This indicates that the parallel calculation was approximately 4.5 times faster than the sequential calculation in this configuration.

## Speedup Analysis Conclusion

The speedup analysis demonstrates the effectiveness of concurrency and parallelism in improving performance for larger problem sizes. The `sum_primes_parallel` function achieves significant speedup when using 8 cores, with a speedup factor of 2.58 for the range of numbers up to 10,000 and a speedup factor of 4.5 for the range of numbers up to 1,000,000.

It's important to note that speedup may not scale linearly with the number of cores used. Factors such as the algorithm's nature, problem size, and hardware capabilities can influence the actual performance obtained.

In summary, the time and speedup analysis highlight the potential benefits of concurrency and parallelism for optimizing performance in larger problem scenarios. However, for smaller problems, the overhead associated with parallelism may outweigh the benefits, making the sequential version more suitable.
