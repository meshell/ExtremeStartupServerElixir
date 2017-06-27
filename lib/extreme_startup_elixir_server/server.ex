defmodule ExtremeStartupElixirServer.Server do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, ExtremeStartupElixirServer.team_name)
  end

  match _ do
    IO.puts inspect conn
    send_resp(conn, 404, "oops")
  end
end
