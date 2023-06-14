defmodule Hw.Primes do
  def is_prime(n) do
    is_prime(n, 2)
  end

  defp is_prime(n, i) when i * i > n, do: true
  defp is_prime(n, i), do: rem(n, i) != 0 && is_prime(n, i + 1)

  def sum_primes(n) when n < 2, do: 0
  def sum_primes(n), do: sum_primes(n, 0)

  defp sum_primes(2, coll), do: coll + 2
  defp sum_primes(n, coll), do: sum_primes(n - 1, coll + (if is_prime(n), do: n, else: 0))

  def make_ranges(start, finish, cores) do
    range_size = div(finish - start + 1, cores)
    Enum.map(0..(cores - 1), fn i ->
      {start + i * range_size, start + (i + 1) * range_size - 1}
    end)
  end

  def main(start, finish, cores \\ System.schedulers) do
    ranges = make_ranges(start, finish, cores)
    ranges
    |> Enum.map(&Task.async(fn -> sum_primes(&1) end))
    |> Enum.map(&Task.await(&1))
    |> Enum.sum()
  end
end
