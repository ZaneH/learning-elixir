defmodule Three do
  def read_file do
    File.read!("./input.txt")
    |> to_string()
    |> String.trim()
    |> String.split("\n")
  end

  def solve do
    read_file()
    |> Enum.map(fn items ->
      split_rucksack(items)
      |> find_shared_item()
      |> convert_to_priorities()
    end)
    |> Enum.sum()
  end

  def solve(:second) do
    read_file()
    |> Enum.chunk_every(3, 3)
    |> Enum.map(fn i ->
      i
      |> find_shared_item()
      |> convert_to_priorities()
    end)
    |> Enum.sum()
  end

  def split_rucksack(item_string) do
    item_count = String.length(item_string)
    half_mark = trunc(item_count / 2)
    comp_one = String.slice(item_string, 0..(half_mark - 1))
    comp_two = String.slice(item_string, half_mark..item_count)
    {comp_one, comp_two}
  end

  def find_shared_item({comp_one, comp_two}) do
    String.graphemes(comp_one)
    |> Enum.filter(fn c ->
      String.contains?(comp_two, c)
    end)
  end

  def find_shared_item([head | string_array]) do
    head
    |> String.graphemes()
    |> Enum.filter(fn c ->
      length(
        Enum.filter(string_array, fn str ->
          String.contains?(str, c)
        end)
      ) == length(string_array)
    end)
  end

  def convert_to_priorities([head | _]) do
    dec = :binary.decode_unsigned(head)

    if dec >= 97 do
      dec - 96
    else
      dec - 38
    end
  end
end
