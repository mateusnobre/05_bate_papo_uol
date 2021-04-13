defmodule BatePapoUolWeb.PageController do
  use BatePapoUolWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
