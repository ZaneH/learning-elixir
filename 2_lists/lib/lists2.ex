require Logger

defmodule Lists2 do
  def print_list do
    [a, b, [x, y, z]] = [1, 2, ["We", "are", "learning!"]]
    Logger.info("List: " <> inspect([a, b, [x, y, z]]))
  end

  def parse_json_list do
    json = "{\"list\": [1, 2, 3]}"
    {:ok, map} = JSON.decode(json)

    Logger.info("JSON list: " <> inspect(map["list"]))
  end

  def try_pin_operator do
    hello = "world"
    [a, ^hello] = [5, "world"]
    %{"a" => a, "hello" => hello}
  end
end
