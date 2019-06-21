defmodule WhatismikedoingnowWeb.GameDesignController do
  use WhatismikedoingnowWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"game" => game}) do
    render(conn, "show.html", game: game)
  end
end
