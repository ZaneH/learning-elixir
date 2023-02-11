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
      extra_applications: [:logger],
      mod: {ExchangeRate, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.6.0"},
      {:poison, "~> 5.0.0"}
    ]
  end
end
