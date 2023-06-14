#Using tastk ti implement concurrency
#Ian Luis Vázquez Morán
#d023-06-09
defmodule Concur do

  def test(message) do
    IO.puts("This is the message: #{message}" )
  end

  #def main() do
   # IO.puts("Main THREAD START")
   # Task.start(fn -> test("One") end)
   # Process.sleep(1)
   # IO.punts("Main THREAD FINISH")
  #end
  def main() do
    pid1 = Task.async(fn -> test("One") end)
    pid2 = Task.async(fn -> test("Two") end)
    pid3 = Task.async(fn -> test("Three") end)
    Task.await(pid1)
    Task.await(pid2)
    Task.await(pid3)
    pid4 = Task.async(Concur, :test, ["hello"])
    Task.await (pid4)
    IO.punts("Main THREAD FINISH")
  end


  def main2() do
    IO.puts("Main THREAD START")
    ["One", "Two", "Threee", "four"]
    |> Enum.map(&Task.async(fn -> test(&1) end))
    |> IO.inspect()
    |> Enum.map(&Task.await(&1))
    |> IO.inspect()
    IO.punts("Main THREAD FINISH")
  end
end

defmodule Parallel do
  def sum_range({start, finish}) do
    Enum.sum(start..finish)
  end

  def make_ranges(start, finish, cores) do
    [{100, 200}, {201, 300}, {301, 400}, {401, 500}]
  end

  def main(start, finish, cores) do
    make_ranges(start, finish, cores)
    |> Enum.map(&Task.async(fn -> sum_range(&1) end))
    |> Enum.map(&Task.await(&1))
    |> Enum.sum()
  end

end
