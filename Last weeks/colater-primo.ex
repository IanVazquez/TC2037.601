#Using tastk ti implement concurrency
#Ian Luis Vázquez Morán
#d023-06-09

defmodule Parallel do

  def sum_range({start, finish}) do
    aux_sume({start, finish}, 0)
  end

  defp aux_sume({start, finish}, count) do
    current_number = start
    validate_prime = aux_prime(2, current_number)
    cond do
      start > finish -> count
      validate_prime==True -> aux_sume({start + 1, finish}, count + current_number)
      true -> aux_sume({start + 1, finish}, count)
    end
  end

  defp aux_prime(i, number) do
    cond do
      number==1 -> False
      i > :math.sqrt(number) -> True
      rem(number, i) == 0 -> False
      true -> aux_prime(i + 1, number)
    end
  end

  def make_ranges(start, finish, cores) do
    amount=finish-start
    labour_div=div(amount,cores)
    prueba=aux_make_ranges(start, finish, cores, labour_div)
  end
  def aux_make_ranges(start, finish, cores, labour_div) do
    cond do
      cores==1 ->[{start, finish}]
      True -> [{start,start+labour_div} | aux_make_ranges(start+labour_div+1, finish, cores-1, labour_div)]
    end
  end


  def main(start, finish, cores) do
    make_ranges(start, finish, cores)
    |> Enum.map(&Task.async(fn -> sum_range(&1) end))
    |> Enum.map(&Task.await(&1,100000000))
    |> Enum.sum()
  end

end
