defmodule ExchangeRate.Api.Util do
  import Plug.Conn

  def respond(conn, {:ok}) do
    conn
    |> send_resp(200, Poison.encode!(%{status: "ok"}))
  end

  def not_found(conn) do
    conn
    |> send_resp(404, Poison.encode!(%{status: "not found"}))
  end
end
