#By Ian Luis Vázquez Morán and Domingo Mora Pérez
#Made in 6/17/2023
defmodule Archivo do
  # Function to create an HTML file with highlighted Python code
  def create_html_file do
    create_html_file(1)  # Call the function with default number of cores (1)
  end

  # Overloaded function to create an HTML file with highlighted Python code
  # Takes the number of cores as an argument
  def create_html_file(cores) when is_integer(cores) and cores > 0 do
    # Get a list of Python files in the current directory
    python_files = File.ls!(".") |> Enum.filter(&String.ends_with?(&1, ".py"))

    case cores do
      1 -> process_files_sequentially(python_files)  # Process files sequentially if there's only one core
      _ -> process_files_in_parallel(python_files, cores)  # Process files in parallel otherwise
    end
  end

  # Process Python files sequentially
  defp process_files_sequentially(python_files) do
    # Read the contents of each Python file and join them with double newlines
    python_code_results = Enum.map(python_files, &read_file/1) |> Enum.join("\n\n")

    generate_and_save_html(python_code_results)  # Generate and save the HTML file
  end

  # Process Python files in parallel
  defp process_files_in_parallel(python_files, cores) do
    # Create tasks to read the contents of each Python file asynchronously
    tasks = Enum.map(python_files, fn file -> Task.async(fn -> read_file(file) end) end)
    # Wait for the tasks to complete and get the results
    python_code_results = tasks |> Enum.map(&Task.await/1) |> Enum.join("\n\n")

    generate_and_save_html(python_code_results)  # Generate and save the HTML file
  end

  # Read the contents of a file
  defp read_file(file_path) do
    File.read!(file_path)
  end

  # Generate and save the HTML file
  defp generate_and_save_html(python_code_results) do
    html_content = generate_html_content(python_code_results)  # Generate the HTML content
    html_file_path = "Reto.html"  # Specify the file path for the HTML file
    File.write(html_file_path, html_content)  # Write the HTML content to the file
    IO.puts("HTML file created at #{html_file_path}")  # Print a message indicating the file creation
  end

  # Read lines from the Python code
  defp read_lines(code) do
    String.split(code, "\n")
  end

  # Format a line of Python code with syntax highlighting
  defp format_line(line) do
    line
    |> highlight_strings()  # Highlight strings
    |> highlight_comments()  # Highlight comments
    |> highlight_variables()  # Highlight variables
    |> highlight_parenthesis()  # Highlight parentheses
    |> highlight_reserved_words()  # Highlight reserved words
    |> highlight_operators()  # Highlight operators
    |> highlight_arithmetic_operators()  # Highlight arithmetic operators
    |> highlight_predef()  # Highlight predefined words
  end

  # Highlight strings in a line
  defp highlight_strings(line) do
    line
    |> String.replace(~r/("(?:\\.|[^"])*")/, "<span class=\"string\">\\0</span>")  # Double-quoted strings
    |> String.replace(~r/('[^']*')/, "<span class=\"string\">\\0</span>")  # Single-quoted strings
  end

  # Highlight comments in a line
  defp highlight_comments(line) do
    line
    |> String.replace(~r/(#.*)$/, "<span class=\"comment\">\\1</span>")  # Comments starting with #
  end

  # Highlight variables in a line
  defp highlight_variables(line) do
    line
    |> String.replace(~r/\b(str|int|bool|char)\b/, "<span class=\"variable\">\\0</span>")  # Highlight specific variable types
  end

  # Highlight parentheses in a line
  defp highlight_parenthesis(line) do
    line
    |> String.replace(~r/[()\[\]{}]/, "<span class=\"parenthesis\">\\0</span>")  # Highlight parentheses, brackets, and braces
  end

  # Highlight reserved words in a line
  defp highlight_reserved_words(line) do
    reserved_words = ~w(False None True and class def is lambda nonlocal not or as assert async
    await break continue del elif else if except finally for from global import in pass raise return try while with yield)
    reserved_words_regex = ~r/(^|\s)(#{Enum.join(reserved_words, "|")})(?=\s|$)/

    line
    |> String.replace(reserved_words_regex, fn match ->
      "<span class=\"reserved-word\">#{match}</span>"  # Highlight reserved words
    end)
  end

  # Highlight operators in a line
  defp highlight_operators(line) do
    comparison_operators = ~w(== != >= <= = < >)
    comparison_operators_regex = ~r/(^|\s)(#{Enum.join(comparison_operators, "|")})(?=\s|$)/

    line
    |> String.replace(comparison_operators_regex, fn match ->
      "<span class=\"comparative-operator\">#{match}</span>"  # Highlight comparison operators
    end)
  end

  # Highlight arithmetic operators in a line
  defp highlight_arithmetic_operators(line) do
    arithmetic_operators_regex = ~r/(?<!\w)(-=|\+=|\*|\+|-|\/)(?!\w)/

    line
    |> String.replace(arithmetic_operators_regex, "<span class=\"arithmetic-operator\">\\1</span>")  # Highlight arithmetic operators
  end

  # Highlight predefined words in a line
  defp highlight_predef(line) do
    line
    |> String.replace(~r/(?<!\w)print(?!\w)/, "<span class=\"predef\">\\0</span>")  # Highlight the predefined word "print"
  end

  # Generate the HTML content with the highlighted Python code
  defp generate_html_content(python_code) do
    python_code
    |> read_lines()  # Split the code into lines
    |> Enum.map(&format_line/1)  # Format each line with syntax highlighting
    |> Enum.join("\n")  # Join the formatted lines
    |> generate_html()  # Wrap the code in HTML tags
  end

  # Generate the complete HTML document with the highlighted code
  defp generate_html(code) do
    """
    <!DOCTYPE html>
    <html lang="es">
      <head>
        <title>Python to Html syntax</title>
        <link rel="stylesheet" href="Reto.css" />  # Link to CSS file for styling
      </head>
      <body>
        <pre>#{code}</pre>  # Wrap the code in a <pre> tag for preserving formatting
      </body>
    </html>
    """
  end
end

# Entry point
Archivo.create_html_file()  # Call the create_html_file function to generate the HTML file
