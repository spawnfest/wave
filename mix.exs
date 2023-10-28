defmodule Wave.MixProject do
  use Mix.Project

  def project do
    [
      app: :wave,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Wave.Application, []}
    ]
  end

  defp deps do
    [
      {:ra, "~> 2.7"},
      {:jason, "~> 1.0"},
      {:postgrex, "~> 0.17.3"}
    ]
  end
end
