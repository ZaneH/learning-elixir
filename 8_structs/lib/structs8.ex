defmodule Ingredient do
  defstruct name: "n/a", amount: 0
end

defmodule Structs8 do
  def start do
    missing_ingredient = %Ingredient{}
    bread = %Ingredient{name: "bread", amount: 10}
    flour = %Ingredient{name: "flour", amount: 99}

    ingredients = [missing_ingredient, bread, flour]

    for ingredient <- ingredients, ingredient.name != "n/a" do
      IO.puts("Found ingredient: #{ingredient.name}")
    end

    restock_ingredients(ingredients)
  end

  def restock_ingredients(ingredients) do
    Enum.map(ingredients, fn
      %Ingredient{name: "bread", amount: _} = ingredient ->
        %Ingredient{name: ingredient.name, amount: 10}

      %Ingredient{name: _, amount: _} = ingredient ->
        %Ingredient{name: ingredient.name, amount: 99}
    end)
    |> Enum.filter(fn
      %Ingredient{name: "n/a", amount: _} -> false
      _ -> true
    end)
  end
end
