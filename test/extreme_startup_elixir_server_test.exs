defmodule ExtremeStartupElixirServerTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts ExtremeStartupElixirServer.Server.init([])

  test "returns team name" do
    # Create a test connection
    conn = conn(:get, "/")

    # Invoke the plug
    conn = ExtremeStartupElixirServer.Server.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == ExtremeStartupElixirServer.team_name
  end
end
