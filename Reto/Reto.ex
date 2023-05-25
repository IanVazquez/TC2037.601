defmodule HTMLGenerator do
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

defp highlighted_code(file_path) do
  categories = categorize_file(file_path)

  categories
  |> Enum.map(fn {category, words} ->
    category_tag = category_to_tag(category)
    words_html = Enum.map(words, &word_to_html(&1))

    "<#{category_tag}>#{Enum.join(words_html, " ")}</#{category_tag}>"
  end)
  |> Enum.join("\n")
end

defp categorize_file(file_path) do
  file_content = File.read!(file_path)
  words = String.split(file_content, ~r/\b\w+\b/)

  categories = %{
    "Atom" => ~r/^(defmodule|def|do|end|when)$/,
    "Identifier" => ~r/^[a-zA-Z_][a-zA-Z0-9_]*$/,
    "String" => ~r/^".*"$/,
    "Number" => ~r/^\d+$/,
    "Boolean" => ~r/^(true|false)$/,
    "Operator" => ~r/^(\+|-|\*|\/|\^)$/
  }

  Enum.group_by(words, fn word ->
    Enum.find_key(categories, &(Regex.match?(Map.get(categories, &1), word)))
  end)
end

defp categorize_word(word) do
  case String.to_existing_atom(word) do
    :ok -> "Atom"
    _ ->
      case String.to_integer(word) do
        {:ok, _} -> "Number"
        _ ->
          case String.to_float(word) do
            {:ok, _} -> "Float"
            _ ->
              case String.downcase(word) do
                "true" or "false" -> "Boolean"
                _ -> "Identifier"
              end
          end
      end
  end
end

defp category_to_tag(category) do
  case category do
    "Atom" -> "span class=\"atom\""
    "Number" -> "span class=\"number\""
    "Float" -> "span class=\"float\""
    "Boolean" -> "span class=\"boolean\""
    "Identifier" -> "span class=\"identifier\""
    _ -> "span"  # Default tag for unrecognized categories
  end
end

defp word_to_html(word) do
  "<span>#{word}</span>"
end
end
