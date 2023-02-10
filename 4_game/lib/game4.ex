defmodule Game4 do
  def start do
    hints = "flour, water, yeat, bakery"
    IO.puts("Hints: #{hints}")

    guess = IO.gets("Guess the word: ") |> String.trim()

    case guess do
      "bread" ->
        IO.puts("Won!")

      _ ->
        IO.puts("Lost!")
    end
  end
end
