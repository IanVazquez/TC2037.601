defmodule Archivo do
  def create_html_file(file_path) do
    elixir_code_result = read_file(file_path)

    html_content = """
      <!DOCTYPE html>
      <html lang="es">
        <head>
          <title>Syntax Highlighter</title>
          <link rel="stylesheet" href="Reto.css" />
        </head>
        <body>
          <!-- Aquí va el resultado del código de Elixir -->
          <p>#{elixir_code_result}</p>
        </body>
      </html>
    """

    html_file_path = "Reto.html"

    File.write(html_file_path, html_content)

    IO.puts("HTML file created at #{html_file_path}")
  end

  def read_file(file_path) do
    file_path
    |> File.stream!()
    |> Enum.map(&shift_line/1)
    |> Enum.join("")
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
    Regex.match?(word_pattern, word) ||
      Regex.match?(reserved_words, word) ||
      Regex.match?(arithmetic_operators, word) ||
      Regex.match?(comparative_operators, word) ||
      Regex.run(word_pattern, word) ||
      Regex.run(reserved_words, word) ||
      Regex.run(arithmetic_operators, word) ||
      Regex.run(comparative_operators, word)
  end

  def is_logical_operator(word) do
    logical_operators = ~r/^(and|or|not)$/
    Regex.match?(logical_operators, word) ||
      Regex.run(logical_operators, word)
  end

  def is_membership_operator(word) do
    membership_operators = ~r/^(in|not in)$/
    Regex.match?(membership_operators, word) ||
      Regex.run(membership_operators, word)
  end

  def is_identity_operator(word) do
    identity_operators = ~r/^(is|is not)$/
    Regex.match?(identity_operators, word) ||
      Regex.run(identity_operators, word)
  end

  def is_bit_operator(word) do
    bit_operators = ~r/^(<<|>>|&|\||\^|~)$/
    Regex.match?(bit_operators, word) ||
      Regex.run(bit_operators, word)
  end

  def determine_identifier_category(identifier) do
    identifier_pattern = ~r/^[a-zA-Z_][a-zA-Z0-9_]*$/
    if Regex.match?(identifier_pattern, identifier) do
      "Identifier"
    else
      nil
    end
  end

  def shift_line(line) do
    words = String.split(line, ~r/\b/)
    formatted_words = Enum.map(words, &format_word(&1))
    Enum.join(formatted_words)
  end

  def format_word(word) do
    if Regex.match?(~r/^[a-zA-Z_][a-zA-Z0-9_]*\(\)$/, word) do
      "<span class=\"function\">#{word}</span>"
    else
      nil
    end


    if Regex.match?(~r/\b(and|as|assert|break|class|continue|def|del|elif|else|except|finally|for|from|global|if|import|in|is|lambda|nonlocal|not|or|pass|raise|return|try|while|with|yield)\b/, word) do
      "<span class=\"reserved-word\">#{word}</span>"
    else
      nil
    end

    if Regex.match?(~r/^(\+|-|\*|\/|%)$/, word) do
      "<span class=\"arithmetic-operator\">#{word}</span>"
    else
      nil
    end

    if Regex.match?(~r/^(==|!=|>|<|>=|<=)$/, word) do
      "<span class=\"comparative-operator\">#{word}</span>"
    else
      nil
    end


    word
  end
end

# Ejemplo de uso
file_path = "lexical.py"
Archivo.create_html_file(file_path)
