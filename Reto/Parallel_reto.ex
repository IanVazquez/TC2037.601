# By Ian Luis Vázquez Morán and Domingo Mora Pérez
# Made in 5/31/2023
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
    |> File.read!() # Read the file contents
    |> format_code() # Format the code
  end

  # Function to format the code
  defp format_code(code) do
    code
    |> String.split("\n")
    |> Enum.map(&format_line/1)
    |> Enum.join("\n")
  end

  # Function to format a line of code
  defp format_line(line) do
    line
    |> String.replace(~r/("(?:\\.|[^"])*")/, "<span class=\"string\">\\0</span>") # Wrap strings in a span with "string" class
    |> String.replace(~r/('[^']*')/, "<span class=\"string\">\\0</span>") # Wrap single-quoted strings in a span with "string" class
    |> String.replace(~r/#[^\n]*/, "<span class=\"comment\">\\0</span>") # Wrap comments in a span with "comment" class
    |> highlight_code() # Highlight code using additional regular expressions
  end

  # Function to highlight code using regular expressions
  defp highlight_code(line) do
    line
    |> String.replace(~r/(\(|\))/, "<span class=\"parenthesis\">\\0</span>") # Wrap parentheses in a span with "parenthesis" class
    |> String.replace(~r/^(str|int|bool|char)$/, "<span class=\"variable\">\\0</span>") # Wrap certain variable types in a span with "variable" class
    |> String.replace(~r/^print$/, "<span class=\"predef\">\\0</span>") # Wrap "print" keyword in a span with "predef" class
    |> String.replace(~r/\b(and|as|assert|break|class|continue|def|del|elif|else|except|finally|for|from|global|if|import|in|is|lambda|nonlocal|not|or|pass|raise|return|try|while|with|yield|True|False|None|len|eval|range)\b/, "<span class=\"reserved-word\">\\0</span>") # Wrap reserved words in a span with "reserved-word" class
    |> String.replace(~r/^(!|>|<|>|<|=)$/, "<span class=\"comparative-operator\">\\0</span>") # Wrap comparative operators in a span with "comparative-operator" class
    |> String.replace(~r/^(\+|-|\*|\/|%|\^)$/, "<span class=\"arithmetic-operator\">\\0</span>") # Wrap arithmetic operators in a span with "arithmetic-operator" class
  end
end

# Example usage
file_path = "Retoprueba.py"
Archivo.create_html_file(file_path)
