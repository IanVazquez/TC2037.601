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

    IO.puts("Code HTML created in #{file_path}")
  end
end

HTMLGenerator.create_html_file()
