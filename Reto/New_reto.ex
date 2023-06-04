#By Ian Luis Vázquez Morán and Domingo Mora Pérez
#Made in 5/31/2023
defmodule Archivo do
  # Function to create an HTML file with formatted code
  def create_html_file(file_path) do
    elixir_code_result = read_file(file_path) # Read the file contents

    # Define the HTML content string with the code result embedded
    html_content = """
      <!DOCTYPE html>
      <html lang="es">
        <head>
          <title>Python to Html syntax</title>
          <link rel="stylesheet" href="Reto.css" />
        </head>
        <body>
          <!-- The result of Elixir code goes here -->
          <pre>#{elixir_code_result}</pre>
        </body>
      </html>
    """

    html_file_path = "Reto.html" # Specify the HTML file path

    File.write(html_file_path, html_content) # Write the HTML content to the file

    IO.puts("HTML file created at #{html_file_path}") # Print a message indicating the file creation
  end

  # Function to read the file and format its contents
  def read_file(file_path) do
    file_path
    |> File.stream!() # Stream the file contents
    |> Enum.map(&format_line/1) # Apply formatting to each line
    |> Enum.join("") # Join the formatted lines together
  end

  # Function to format a line of code
  def format_line(line) do
    words = String.split(line, ~r/(?<=\W)|(?=\W)/u) # Split the line into individual words
    formatted_words = Enum.map(words, &format_word/1) # Apply formatting to each word
    Enum.join(formatted_words) # Join the formatted words together
  end

  # Function to format a word based on certain rules
  def format_word(word) do
    cond do
      is_comment(word) -> "<span class=\"comment\">#{word}</span>" # Wrap comments in a span with "comment" class
      is_whitespace(word) -> word # Return whitespace as is
      is_parenthesis(word) -> "<span class=\"parenthesis\">#{word}</span>" # Wrap parentheses in a span with "parenthesis" class
      Regex.match?(~r/^(str|int|bool|char)$/, word) -> "<span class=\"variable\">#{word}</span>" # Wrap certain variable types in a span with "variable" class
      Regex.match?(~r/^print$/, word) -> "<span class=\"predef\">#{word}</span>" # Wrap "print" keyword in a span with "predef" class
      Regex.match?(~r/\b(and|as|assert|break|class|continue|def|del|elif|else|except|finally|for|from|global|if|import|in|is|lambda|nonlocal|not|or|pass|raise|return|try|while|with|yield|True|False|None|len|eval|range)\b/, word) -> "<span class=\"reserved-word\">#{word}</span>" # Wrap reserved words in a span with "reserved-word" class
      Regex.match?(~r/^(!|>|<|>|<|=)$/, word) -> "<span class=\"comparative-operator\">#{word}</span>" # Wrap comparative operators in a span with "comparative-operator" class
      Regex.match?(~r/^(\+|-|\*|\/|%|\^)$/, word) -> "<span class=\"arithmetic-operator\">#{word}</span>" # Wrap arithmetic operators in a span with "arithmetic-operator" class
      true -> word # Return the word as is
    end
  end

  # Function to check if a word is whitespace
  def is_whitespace(word) do
    String.trim(word) == ""
  end

  # Function to check if a word is a comment
  def is_comment(word) do
    Regex.match?(~r/^#[^\n]*/, word)
  end

  # Function to check if a word is parentheses
  def is_parenthesis(word) do
    Regex.match?(~r/^[()\[\]{}]+$/, word)
  end
end

# Example usage
file_path = "Retoprueba.py"
Archivo.create_html_file(file_path)
