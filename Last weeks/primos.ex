# Using Task to implement concurrency
# Domingo Mora
# Ian Luis Vázquez Morán
# 2023-06-09
defmodule Hw.Primes do
  # Function to calculate the sum of prime numbers up to a given limit
  def sum_primes(limit) do
    sum_range({1, limit - 1})
  end

  # Helper function to calculate the sum within a given range
  defp sum_range({start, finish}) do
    aux_sume({start, finish}, 0)
  end

  # Recursive function to calculate the sum of prime numbers within the range
  defp aux_sume({start, finish}, count) do
    current_number = start
    validate_prime = aux_prime(2, current_number)
    cond do
      start > finish -> count  # Base case: if start > finish, return the current sum
      validate_prime == true -> aux_sume({start + 1, finish}, count + current_number)  # If the current number is prime, add it to the sum
      true -> aux_sume({start + 1, finish}, count)  # If the current number is not prime, continue to the next number
    end
  end

  # Helper function to check if a number is prime
  defp aux_prime(i, number) do
    cond do
      number == 1 -> false  # 1 is not a prime number
      i > :math.sqrt(number) -> true  # If we have checked up to the square root of the number, it is prime
      rem(number, i) == 0 -> false  # If the number is divisible by i, it is not prime
      true -> aux_prime(i + 1, number)  # Continue checking with the next value of i
    end
  end

  # Function to divide the range into smaller ranges based on the number of cores
  def make_ranges(start, finish, cores) do
    amount = finish - start
    labour_div = div(amount, cores)
    aux_make_ranges(start, finish, cores, labour_div)
  end

  # Recursive function to create the smaller ranges
  def aux_make_ranges(start, finish, cores, labour_div) do
    cond do
      cores == 1 -> [{start, finish}]  # Base case: if there's only one core, return the final range and limiting recursion
      true -> [{start, start + labour_div} | aux_make_ranges(start + labour_div + 1, finish, cores - 1, labour_div)]  # Divide the range and continue recursively
    end
  end

  # Function to calculate the sum of prime numbers in parallel using multiple cores
  def sum_primes_parallel(start, finish, cores) do
    make_ranges(start, finish, cores)
    |> Enum.map(&Task.async(fn -> sum_range(&1) end))  # Create tasks to calculate the sum in each smaller range
    |> Enum.map(&Task.await(&1, 100000000))  # Wait for each task to finish and retrieve the results
    |> Enum.sum()  # Sum the results from each task to get the final result
  end
end
