defmodule Archivo do
  def create_html_file(file_path) do
    elixir_code_result = read_file(file_path)

    html_content = """
      <!DOCTYPE html>
      <html lang="es">
        <head>
          <title>Python to Html syntax</title>
          <link rel="stylesheet" href="Reto.css" />
        </head>
        <body>
          <!-- Aquí va el resultado del código de Elixir -->
          <pre>#{elixir_code_result}</pre>
        </body>
      </html>
    """

    html_file_path = "Reto2.html"

    File.write(html_file_path, html_content)

    IO.puts("HTML file created at #{html_file_path}")
  end

  def read_file(file_path) do
    file_path
    |> File.stream!()
    |> Enum.map(&format_line/1)
    |> Enum.join("")
  end

  def format_line(line) do
    words = String.split(line, ~r/(?<=\W)|(?=\W)/u)
    formatted_words = Enum.map(words, &format_word/1)
    Enum.join(formatted_words)
  end

  def format_word(word) do
    cond do
      is_whitespace(word) -> word
      is_comment(word) -> "<span class=\"comment\">#{word}</span>"
      is_parenthesis(word) -> "<span class=\"parenthesis\">#{word}</span>"
      Regex.match?(~r/^[a-zA-Z_][a-zA-Z0-9_]*\(\)$/, word) ->
        "<span class=\"function\">#{word}</span>"
      Regex.match?(~r/\b(and|as|assert|break|class|continue|def|del|elif|else|except|finally|for|from|global|if|import|in|is|lambda|nonlocal|not|or|pass|raise|return|try|while|with|yield|True|False|None|len|eval|range)\b/, word) ->
        "<span class=\"reserved-word\">#{word}</span>"
      Regex.match?(~r/^(==|!=|>|<|>=|<=)$/u, word) ->
        "<span class=\"comparative-operator\">#{word}</span>"
      Regex.match?(~r/^(\+|-|\*|\/|%|\^|=)$/u, word) ->
        "<span class=\"arithmetic-operator\">#{word}</span>"
      true -> word
    end
  end

  def is_whitespace(word) do
    String.trim(word) == ""
  end

  def is_comment(word) do
    String.starts_with?(word, "#")
  end

  def is_parenthesis(word) do
    Regex.match?(~r/^[()\[\]{}]+$/, word)
  end
end

# Ejemplo de uso
file_path = "queens.py"
Archivo.create_html_file(file_path)
