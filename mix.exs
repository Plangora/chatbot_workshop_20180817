defmodule Alfred.MixProject do
  use Mix.Project

  def project do
    [
      app: :alfred,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Alfred.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Basis of our ChatBot
      {:hedwig, "~> 1.0"},
      # Used for sending GET request for GiphMe responder
      {:httpoison, "~> 0.11"},
      # Used for decoding JSON
      {:jason, "~> 1.1.1"}
    ]
  end
end
