defmodule Range5 do
  def start do
    for i <- 0..10 do
      IO.puts(i)
    end
  end

  def enum_start do
    Enum.each(0..10, fn
      0 -> :noop
      i -> IO.inspect(i)
    end)
  end
end
