import Integer

defmodule Comprehensions7 do
  def start do
    word_list = ~w(bread flour water yeast)

    for w <- word_list do
      IO.puts("Found ingredient: #{w}")
    end

    :ok
  end

  def print_amounts do
    ingredients = %{"bread" => 4, "flour" => 3, "water" => 2, "yeast" => 1}

    for {name, amount} <- ingredients do
      IO.puts("Found #{amount} of #{name}")
    end
  end

  def print_ok_ingredients do
    ingredients = [ok: "bread", expired: "flour", ok: "water", expired: "yeast"]

    for {:ok, name} <- ingredients do
      IO.puts("Found an :ok ingredient: #{name}")
    end
  end

  def number_of_good_ingredients do
    result = print_ok_ingredients()
    length(result)
  end

  def print_times_table do
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    for n <- numbers, times <- numbers do
      IO.puts("#{n} * #{times} = #{n * times}")
    end

    :ok
  end

  def print_even_times_table do
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    for n <- numbers, times <- numbers, is_even(n * times) do
      IO.puts("#{n} * #{times} = #{n * times}")
    end

    :ok
  end

  def restock_ingredients do
    ingredients = [bread: 0, flour: 0, water: 0, yeast: 0]

    for {name, _amount} <- ingredients, into: [] do
      case name do
        :bread -> {name, 10}
        _ -> {name, 99}
      end
    end
  end
end
