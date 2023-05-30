# archivo.ex

defmodule Archivo do
  def read_file(file_path) do
    categories = %{
      "String" => [],
      "Integer" => [],
      "Boolean" => [],
      "Identifier" => [],
      "Function" => []
    }

    with {:ok, file} <- File.open(file_path, [:read]) do
      Enum.each(IO.stream(file), fn line ->
        words = Regex.scan(~r/\b\w+\b/, line)

        Enum.each(words, fn {_, word} ->
          category =
            if is_literal(word) do
              determine_literal_category(word)
            elsif is_function(word) do
              "Function"
            else
              determine_identifier_category(word)
            end

          if category do
            categories[category] = [word | categories[category]]
          end
        end)
      end)
    end

    categories
  end

  def is_literal(word) do
    try do
      Code.eval_string(word)
      true
    rescue
      _ -> false
    end
  end

  def determine_literal_category(literal) do
    case Code.eval_string(literal) do
      s when is_binary(s) -> "String"
      i when is_integer(i) -> "Integer"
      b when is_boolean(b) -> "Boolean"
      _ -> nil
    end
  end

  def is_function(word) do
    pattern = ~r/^[a-zA-Z_][a-zA-Z0-9_]*\(\)$/
    Regex.match?(pattern, word)
  end

  def determine_identifier_category(identifier) do
    pattern = ~r/^[a-zA-Z_][a-zA-Z0-9_]*$/
    if Regex.match?(pattern, identifier) do
      "Identifier"
    else
      nil
    end
  end

  def get_category_counts(categories) do
    counts = %{}
    for category <- Map.keys(categories) do
      counts[category] = length(categories[category])
    end
    counts
  end
end

# Ejemplo de uso
file_path = "ruta/al/archivo.txt"
categories = Archivo.read_file(file_path)
counts = Archivo.get_category_counts(categories)
IO.inspect(counts)
