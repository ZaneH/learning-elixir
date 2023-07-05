defmodule Four do
  def read_file do
    File.read!("./input.txt")
    |> to_string()
    |> String.trim()
    |> String.split("\n")
  end

  def solve do
    read_file()
    |> parse_range_pairs()
    |> Enum.filter(fn range_pair ->
      is_full_overlap?(range_pair)
    end)
    |> length
  end

  def solve(:second) do
    read_file()
    |> parse_range_pairs()
    |> Enum.filter(fn range_pair ->
      is_partial_overlap?(range_pair)
    end)
    |> length()
  end

  def is_partial_overlap?([range_1, range_2]) do
    [range_1_start, range_1_end] = range_1
    [range_2_start, range_2_end] = range_2

    range_list_1 =
      Range.new(range_1_start, range_1_end)
      |> Range.to_list()

    range_list_2 =
      Range.new(range_2_start, range_2_end)
      |> Range.to_list()

    one_has_two =
      Enum.any?(range_list_1, fn r ->
        not is_nil(Enum.find_index(range_list_2, &(&1 == r)))
      end)

    two_has_one =
      Enum.any?(range_list_2, fn r ->
        not is_nil(Enum.find_index(range_list_1, &(&1 == r)))
      end)

    one_has_two or two_has_one
  end

  def is_full_overlap?([range_1, range_2]) do
    [range_1_start, range_1_end] = range_1
    [range_2_start, range_2_end] = range_2

    if range_1_start >= range_2_start and
         range_1_end <= range_2_end do
      true
    else
      if range_2_start >= range_1_start and
           range_2_end <= range_1_end do
        true
      else
        false
      end
    end
  end

  def parse_range_pairs(input) do
    Enum.map(input, fn row ->
      pairs = String.split(row, ",")

      Enum.map(pairs, fn p ->
        [start_idx, end_idx] = String.split(p, "-")
        {start_idx, _} = Integer.parse(start_idx)
        {end_idx, _} = Integer.parse(end_idx)

        [start_idx, end_idx]
      end)
    end)
  end
end
