defmodule WhatismikedoingnowWeb.Router do
  use WhatismikedoingnowWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WhatismikedoingnowWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/gamedesign", GameDesignController, :index
    get "/gamedesign/:game", GameDesignController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", WhatismikedoingnowWeb do
  #   pipe_through :api
  # end
end
