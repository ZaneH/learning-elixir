defmodule FriendsEcto10.MixProject do
  use Mix.Project

  def project do
    [
      app: :friends_ecto_10,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {FriendsEcto10.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.2"},
      {:postgrex, "~> 0.15"},
      {:ecto_sql, "~> 3.9.2"}
    ]
  end
end
