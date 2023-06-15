| By                                     | Created on       |
|----------------------------------------|------------------|
| **Ian Luis Vázquez Moran \| A01027225** | **6/14/2023**    |
| **Domingo Mora Pérez \| A01783317**      |                  |
# Time Analysis

For the `sum_primes` function (sequential calculation), the execution time varied depending on the problem size. 

- For the range of numbers up to 500, it took approximately 2.04e-4 seconds (0.000204 seconds).
- For the range of numbers up to 10,000, it took approximately 0.009011 seconds.
- For the range of numbers up to 1,000,000, it took approximately 3.505766 seconds.

For the `sum_primes_parallel` function (parallel calculation using concurrency), the execution time also varied depending on the problem size and the core configuration.

- For the range of numbers up to 500, there was no significant improvement in performance compared to the sequential version.
- For the range of numbers up to 10,000, the execution time was approximately 0.003481 seconds using 8 cores.
- For the range of numbers up to 1,000,000, the execution time was approximately 0.779366 seconds using 8 cores.

# Speedup Analysis

Speedup is calculated as the ratio between the sequential execution time and the parallel execution time. A speedup greater than 1 indicates an improvement in performance through the use of concurrency and parallelism.

- For the range of numbers up to 10,000, the speedup obtained using 8 cores was approximately 2.58 (0.009011 seconds / 0.003481 seconds). This means that the parallel calculation was approximately 2.58 times faster than the sequential calculation in this configuration.
- For the range of numbers up to 1,000,000, the speedup obtained using 8 cores was approximately 4.5 (3.505766 seconds / 0.779366 seconds). This indicates that the parallel calculation was approximately 4.5 times faster than the sequential calculation in this configuration.

In general, the time and speedup analysis shows that the use of concurrency and parallelism can provide significant performance improvements for larger problems. However, for smaller problems, the additional cost of task creation and management in the parallel version may outweigh the benefits, and the sequential version may be sufficient.

It is important to note that speedup does not always scale linearly with the number of cores used. Factors such as the nature of the algorithm, problem size, and hardware capabilities can influence the performance obtained.
