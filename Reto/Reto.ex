



defmodule Archivo do
  def create_html_file do
    html_content = """
      <!DOCTYPE html>
      <html lang="es">
        <head>
          <title>Syntax highlighter</title>
          <link rel="stylesheet" href="Reto.css" />
        </head>
        <body>

          <!-- Aquí va el resultado del código de Elixir -->

        </body>
      </html>
    """

    file_path = "Reto.html"

    File.write(file_path, html_content)

    IO.puts("HTML code created in #{file_path}")
  end

  def read_file(file_path) do
    categories = %{
      "String" => [],
      "Integer" => [],
      "Boolean" => [],
      "Identifier" => [],
      "Function" => []
    }

    with {:ok, file} <- File.open(file_path, [:read]) do
      Enum.each(IO.stream(file, :line), fn line ->
        line |> IO.inspect(:label, "line:")
        words = Regex.scan(~r/\b\w+\b/, line)

        Enum.each(words, fn {_, word} ->
          category =
            if is_literal(word) do
              determine_literal_category(word)
            else
              if is_word_function(word), do: "Function", else: determine_identifier_category(word)
            end

          categories = update_categories(categories, category, word)
        end)
      end)
    end

    categories
  end

  def update_categories(categories, category, word) do
    Map.update(categories, category, [word], &([&1 | &2]))
  end

  def is_literal(word) do
    try do
      Code.eval_string(word)
      true
    rescue
      ArgumentError -> false
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

  def is_word_function(word) do
    word_pattern = ~r/^[a-zA-Z_][a-zA-Z0-9_]*\(\)$/
    reserved_words = ~r/\b(and|as|assert|break|class|continue|def|del|elif|else|except|finally|for|from|global|if|import|in|is|lambda|nonlocal|not|or|pass|raise|return|try|while|with|yield)\b/
    arithmetic_operators = ~r/^(\+|-|\*|\/|%)$/
    comparative_operators = ~r/^(==|!=|>|<|>=|<=)$/
    Regex.match?(word_pattern, word)
  end

  def is_logical_operator(word) do
    logical_operators = ~r/^(and|or|not)$/
    Regex.match?(logical_operators, word)
  end

  def is_membership_operator(word) do
    membership_operators = ~r/^(in|not in)$/
    Regex.match?(membership_operators, word)
  end

  def is_identity_operator(word) do
    identity_operators = ~r/^(is|is not)$/
    Regex.match?(identity_operators, word)
  end
  def is_bit_operator(word) do
    bit_operators = ~r/^(<<|>>|&|\||\^|~)$/
    Regex.match?(bit_operators, word)
  end

  def determine_identifier_category(identifier) do
    identifier_pattern = ~r/^[a-zA-Z_][a-zA-Z0-9_]*$/
    if Regex.match?(identifier_pattern, identifier), do: "Identifier", else: nil
  end

  def get_category_counts(categories) do
    Enum.into(categories, %{}, fn {category, words} ->
      {category, length(words)}
    end)
  end
end

# Ejemplo de uso
file_path = "/lexical.py"
file_categories = Archivo.read_file(file_path)
counts = Archivo.get_category_counts(file_categories)
IO.inspect(counts)
