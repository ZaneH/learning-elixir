defmodule Two do
  def read_file do
    input_data = File.read!("./input.txt")
    to_string(input_data)
  end

  def calculate_hand_score(opp_hand, me_hand) do
    win = did_win?(opp_hand, me_hand)
    win_score = get_win_score(win)

    hand_score = get_hand_score(me_hand)

    win_score + hand_score
  end

  def play_hand(hand_row) do
    case String.split(hand_row, " ") do
      [opp, me] ->
        opp_hand = translate_code(opp)
        me_hand = translate_code(me)
        calculate_hand_score(opp_hand, me_hand)

      _ ->
        IO.puts("Skipping invalid row: #{inspect(hand_row)}")
        0
    end
  end

  def get_losing_hand("R"), do: "S"
  def get_losing_hand("P"), do: "R"
  def get_losing_hand("S"), do: "P"

  def get_winning_hand("R"), do: "P"
  def get_winning_hand("P"), do: "S"
  def get_winning_hand("S"), do: "R"

  def play_hand_alt(hand_row) do
    case String.split(hand_row, " ") do
      [opp, instruction] ->
        opp_hand = translate_code(opp)

        case instruction do
          "X" ->
            me_hand = get_losing_hand(opp_hand)
            calculate_hand_score(opp_hand, me_hand)

          "Y" ->
            me_hand = opp_hand
            calculate_hand_score(opp_hand, me_hand)

          "Z" ->
            me_hand = get_winning_hand(opp_hand)
            calculate_hand_score(opp_hand, me_hand)
        end

      _ ->
        IO.puts("Skipping invalid row: #{inspect(hand_row)}")
        0
    end
  end

  def play_input do
    read_file()
    |> String.split("\n")
    |> Enum.map(&play_hand(&1))
    |> Enum.sum()
  end

  def play_input_alt do
    read_file()
    |> String.split("\n")
    |> Enum.map(&play_hand_alt(&1))
    |> Enum.sum()
  end

  def translate_code("A"), do: "R"
  def translate_code("X"), do: "R"
  def translate_code("B"), do: "P"
  def translate_code("Y"), do: "P"
  def translate_code("C"), do: "S"
  def translate_code("Z"), do: "S"

  def get_win_score(:tie), do: 3
  def get_win_score(true), do: 6
  def get_win_score(false), do: 0

  def get_hand_score("R"), do: 1
  def get_hand_score("P"), do: 2
  def get_hand_score("S"), do: 3

  def did_win?(opp_hand, me_hand) do
    case me_hand do
      ^opp_hand = ^me_hand -> :tie
      "R" -> opp_hand == "S"
      "P" -> opp_hand == "R"
      "S" -> opp_hand == "P"
    end
  end
end
