defmodule ExtremeStartupElixirServer do
@moduledoc """
Extreme Startup server skeleton implementation in Elixir.
Starting point for the ["extreme startup"](https://github.com/rchatley/extreme_startup) workshop by Robert Chatley and Matt Wynne.
"""

  use Application
  require Logger

  @team_name Application.get_env(:extreme_startup_server, :team_name, "Alchemists")


  def team_name() do
      "#{@team_name}"
  end

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
      port = Application.get_env(:extreme_startup_elixir_server, :server_port, 8080)
      children = [
        # Define workers and child supervisors to be supervised
        Plug.Adapters.Cowboy.child_spec(:http, ExtremeStartupElixirServer.Server, [], [port: port])
      ]

      name = team_name()
      Logger.info "Started Extreme startup server: #{name} on port #{port}"
      # See https://hexdocs.pm/elixir/Supervisor.html
      # for other strategies and supported options
      opts = [strategy: :one_for_one, name: ExtremeStartupElixirServer.Supervisor]
      Supervisor.start_link(children, opts)
    end
end
