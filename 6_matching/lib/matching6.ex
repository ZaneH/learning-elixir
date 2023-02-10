defmodule Matching6 do
  @answers {"cheese", "lettuce", "chicken"}

  def start do
    correct_answer = elem(@answers, :rand.uniform(tuple_size(@answers)) - 1)

    # cheats
    # IO.inspect(correct_answer)

    IO.puts("Let's play a game!")
    attempt(0, nil, correct_answer)
  end

  def attempt(guess_count, guess \\ nil, correct_answer)

  def attempt(_, guess, correct_answer) when guess == correct_answer do
    IO.puts("You won!")
  end

  def attempt(3, _, _) do
    IO.puts("You lost!")
  end

  def attempt(guess_count, _guess, correct_answer) do
    if guess_count > 0 do
      IO.puts("Incorrect, try again!")
    end

    guess = IO.gets("Your guess: ") |> String.trim() |> String.downcase()

    attempt(guess_count + 1, guess, correct_answer)
  end
end
