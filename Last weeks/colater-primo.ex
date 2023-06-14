#Using tastk ti implement concurrency
#Domingo Mora
#Ian Luis Vázquez Morán
#2023-06-09

defmodule Hw.Primes do

  def sum_range_parallel({start, finish}) do
    aux_sume_parallel({start, finish}, 0)
  end

  defp aux_sume_parallel({start, finish}, count) do
    current_number = start
    validate_prime = aux_prime_parallel(2, current_number)
    cond do
      start > finish -> count
      validate_prime==True -> aux_sume_parallel({start + 1, finish}, count + current_number)
      true -> aux_sume_parallel({start + 1, finish}, count)
    end
  end

  defp aux_prime_parallel(i, number) do
    cond do
      number==1 -> False
      i > :math.sqrt(number) -> True
      rem(number, i) == 0 -> False
      true -> aux_prime_parallel(i + 1, number)
    end
  end

  def make_ranges_parallel(start, finish, cores) do
    amount=finish-start
    labour_div=div(amount,cores)
    prueba=aux_make_ranges_parallel(start, finish, cores, labour_div)
  end
  def aux_make_ranges_parallel(start, finish, cores, labour_div) do
    cond do
      cores==1 ->[{start, finish}]
      True -> [{start,start+labour_div} | aux_make_ranges_parallel(start+labour_div+1, finish, cores-1, labour_div)]
    end
  end


  def sum_primes_parallel(start, finish, cores) do
    make_ranges_parallel(start, finish, cores)
    |> Enum.map(&Task.async(fn -> sum_range_parallel(&1) end))
    |> Enum.map(&Task.await(&1,100000000))
    |> Enum.sum()
  end

end
