# Domingo Mora | A01783317
# Ian Vazquez |
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

  def read_file(file_path, "Reto.html") do
    data = file_path
           # Read the file, line by line
           |> File.stream!()
           # Call a function with each line read
           |> Enum.map(&shift_line(&1))
           #|> IO.inspect()
           |> Enum.join("")

    # Store the results in a new file
    File.write("Reto.html", data)
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
    Regex.match?(reserved_words, word)
    Regex.match?(arithmetic_operators, operator)
    Regex.match?(comparative_operators, operator)
    Regex.run(word_pattern, word)
    Regex.run(reserved_words, word)
    Regex.run(arithmetic_operators, operator)
    Regex.run(comparative_operators, operator)
  end

  def is_logical_operator(word) do
    logical_operators = ~r/^(and|or|not)$/
    Regex.match?(logical_operators, word)
    Regex.run(logical_operators, word)
  end

  def is_membership_operator(word) do
    membership_operators = ~r/^(in|not in)$/
    Regex.match?(membership_operators, word)
    Regex.run(membership_operators, word)
  end

  def is_identity_operator(word) do
    identity_operators = ~r/^(is|is not)$/
    Regex.match?(identity_operators, word)
    Regex.run(identity_operators, word)
  end
  def is_bit_operator(word) do
    bit_operators = ~r/^(<<|>>|&|\||\^|~)$/
    Regex.match?(bit_operators, word)
    Regex.run(bit_operators, word)
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
