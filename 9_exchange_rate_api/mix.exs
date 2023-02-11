defmodule ExchangeRateApi9.MixProject do
  use Mix.Project

  def project do
    [
      app: :exchange_rate_api_9,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications:
        extra_applications(Mix.env(), [
          :logger,
          :con_cache,
          :httpoison
        ]),
      mod: {ExchangeRate, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:con_cache, "~> 1.0.0"},
      {:plug_cowboy, "~> 2.6.0"},
      {:poison, "~> 5.0.0"},
      {:lettuce, "~> 0.2.0", only: :dev},
      {:httpoison, "~> 2.0.0"}
    ]
  end

  defp extra_applications(:dev, default), do: default ++ [:lettuce]
  defp extra_applications(_env, default), do: default
end
