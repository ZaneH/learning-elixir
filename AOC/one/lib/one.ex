defmodule One do
  def read_file(path) do
    data = File.read!(path)

    to_string(data)
    |> String.split("\n")
  end

  def convert_to_int_chunks(array) when is_list(array) do
    array
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.filter(&(&1 != [""]))
    |> Enum.map(fn v ->
      Enum.map(v, fn j ->
        {int_value, _} = Integer.parse(j)
        int_value
      end)
    end)
  end

  def calculate_chunk_sums(array) when is_list(array) do
    chunk_sums =
      Enum.map(array, fn chunk ->
        Enum.sum(chunk)
      end)

    chunk_sums
    |> Enum.sort(:desc)
  end

  def sum_top_three(array) when is_list(array) do
    Enum.slice(array, 0..2)
    |> Enum.sum()
  end
end
