defmodule FourTest do
  use ExUnit.Case
  doctest Four

  test "greets the world" do
    assert Four.hello() == :world
  end
end
