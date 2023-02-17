defmodule Friends.Repo do
  use Ecto.Repo,
    otp_app: :friends_ecto_10,
    adapter: Ecto.Adapters.Postgres
end
