# archivo.ex


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
      Enum.each(IO.stream(file), fn line ->
        words = Regex.scan(~r/\b\w+\b/, line)

        Enum.each(words, fn {_, word} ->
          category =
            if is_literal(word) do
              determine_literal_category(word)
            else
              if is_function(word) do
              "Function"
            else
              determine_identifier_category(word)
            end
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


# defmodule HTMLGenerator do
#   def create_html_file do
#     html_content = """
#       <!DOCTYPE html>
#       <html lang="es">
#         <head>
#           <title>Syntax highlighter</title>
#           <link rel="stylesheet" href="Reto.css" />
#         </head>
#         <body>

#           <!-- Aquí va el resultado del código de Elixir -->

#         </body>
#       </html>
#     """

#     file_path = "Reto.html"

#     File.write(file_path, html_content)

#     IO.puts("HTML code created in #{file_path}")
#   end
# end

# # defmodule Archivo do
# #   def read_file(file_path) do
# #     file_categories = %{
# #       "String" => [],
# #       "Integer" => [],
# #       "Boolean" => [],
# #       "Identifier" => [],
# #       "Function" => []
# #     }

# #     with {:ok, file} <- File.open(file_path, [:read]) do
# #       Enum.each(IO.stream(file), fn line ->
# #         words = Regex.scan(~r/\b\w+\b/, line)

# #         Enum.each(words, fn {_, word} ->
# #           category =
# #             if is_literal(word) do
# #               determine_literal_category(word)
# #             else
# #               if is_function(word), do: "Function",
# #                 else: determine_identifier_category(word)
# #             end

# #           categories = update_categories(categories, category, word)
# #         end)
# #       end)
# #     end

# #     categories
# #   end
# defmodule Archivo do
#   def read_file(file_path) do
#     categories = %{
#       "String" => [],
#       "Integer" => [],
#       "Boolean" => [],
#       "Identifier" => [],
#       "Function" => []
#     }

#     with {:ok, file} <- File.open(file_path, [:read]) do
#       Enum.each(IO.stream(file), fn line ->
#         words = Regex.scan(~r/\b\w+\b/, line)

#         Enum.each(words, fn {_, word} ->
#           category =
#             if is_literal(word) do
#               determine_literal_category(word)
#             else
#               if is_function(word), do: "Function", else: determine_identifier_category(word)
#             end

#           categories = update_categories(categories, category, word)
#         end)
#       end)
#     end

#     categories
#   end

#   def update_categories(categories, category, word) do
#     Map.update(categories, category, [word], &([&1 | &2]))
#   end

#   def is_literal(word) do
#   try do
#     Code.eval_string(word)
#     true
#   rescue
#     ArgumentError -> false
#   end
# end

#   def determine_literal_category(literal) do
#     case Code.eval_string(literal) do
#       s when is_binary(s) -> "String"
#       i when is_integer(i) -> "Integer"
#       b when is_boolean(b) -> "Boolean"
#       _ -> nil
#     end
#   end

#   def is_function(word) do
#     pattern = ~r/^[a-zA-Z_][a-zA-Z0-9_]*\(\)$/
#     Regex.match?(pattern, word)
#   end

#   def determine_identifier_category(identifier) do
#     pattern = ~r/^[a-zA-Z_][a-zA-Z0-9_]*$/
#     if Regex.match?(pattern, identifier), do: "Identifier", else: nil
#   end

#   def get_category_counts(categories) do
#     Enum.into(categories, %{}, fn {category, words} ->
#       {category, length(words)}
#     end)
#   end
# end

# # Ejemplo de uso
# file_path = "./lexical.py"
# categories = Archivo.read_file(file_path)
# counts = Archivo.get_category_counts(categories)
# IO.inspect(counts)
