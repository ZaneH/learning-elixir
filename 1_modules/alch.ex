defmodule Alch do
  def hello do
    "Hello, world!"
  end

  def custom_hello(name) do
    "Hello, #{name}!"
  end

  def read_file do
    File.write("test.txt", "Hello, world!")
    File.read("test.txt")
  end

  def print_object_value(%{"key" => value}) do
    IO.puts(value)
  end
end
