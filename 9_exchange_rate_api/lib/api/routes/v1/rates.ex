defmodule ExchangeRate.Api.Routes.V1.Rates do
  use Plug.Router

  alias ExchangeRate.Api.Util
  alias ExchangeRate.Currency.Cache

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> Util.respond({:ok})
  end

  get "/:currency" do
    case Cache.get(conn.params["currency"]) do
      nil ->
        conn
        |> Util.respond({:error, "Currency not found"})

      rate ->
        conn
        |> Util.respond({:ok, %{currency: rate}})
    end
  end
end
