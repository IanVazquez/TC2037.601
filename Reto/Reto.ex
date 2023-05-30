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

defmodule HTMLGenerator do
  def create_html_file(file_path) do
    file_content = File.read!(file_path)
    categories = categorize_file(file_content)
    html_content = generate_html(categories)

    html_file_path = "output.html"
    File.write(html_file_path, html_content)

    IO.puts("HTML file created: #{html_file_path}")
  end

  defp categorize_file(file_content) do
    words = String.split(file_content, ~r/\b\w+\b/)
    Enum.reduce(words, %{}, fn word, acc ->
      category = categorize_word(word)
      Map.update(acc, category, [word], & [&1 | word])
    end)
  end

  defp categorize_word(word) do
    case word do
      _ when is_atom(word) -> :atom
      _ when is_number(word) -> :number
      _ when is_binary(word) -> :string
      _ -> :identifier
    end
  end

  defp generate_html(categories) do
    categories
    |> Enum.map(fn {category, words} ->
      tag = category_to_tag(category)
      html_words = Enum.map(words, &word_to_html(&1))
      "<#{tag}>#{Enum.join(html_words)}</#{tag}>"
    end)
    |> Enum.join("\n")
  end

  defp category_to_tag(category) do
    case category do
      :atom -> "span class=\"atom\""
      :number -> "span class=\"number\""
      :string -> "span class=\"string\""
      _ -> "span class=\"identifier\""
    end
  end

  defp word_to_html(word) do
    "<span>#{word}</span>"
  end
end
