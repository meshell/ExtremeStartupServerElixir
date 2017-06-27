defmodule ExtremeStartupElixirServer.Mixfile do
  use Mix.Project

  def project do
    [app: :extreme_startup_elixir_server,
     version: "0.1.0",
     elixir: "~> 1.3",
     name: "Extreme Startup Server",
     description: "Extreme Startup server skeleton implementation in Elixir",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger, :cowboy, :plug, :ex_doc, :earmark],
      mod: {ExtremeStartupElixirServer, []},
      env: [server_port: 8080]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:cowboy,   "~> 1.1.2"},
      {:plug,     "~> 1.3.5"},
      {:ex_doc,   "~> 0.16.1"},
      {:earmark,  "~> 1.1", override: true},
      {:exrm,     "~> 1.0.8"},
    ]
  end
end
