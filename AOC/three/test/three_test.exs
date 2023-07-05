defmodule ThreeTest do
  use ExUnit.Case
  doctest Three

  test "greets the world" do
    assert Three.hello() == :world
  end
end
