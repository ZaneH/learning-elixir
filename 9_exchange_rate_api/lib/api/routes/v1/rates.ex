defmodule ExchangeRate.Api.Routes.V1.Rates do
  use Plug.Router

  alias ExchangeRate.Api.Util

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> Util.respond({:ok})
  end
end
