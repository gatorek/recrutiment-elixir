defmodule GamecodeWeb.Router do
  use GamecodeWeb, :router

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

  scope "/", GamecodeWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", GamecodeWeb do
    pipe_through :api

    post "/trips", TripController, :add
    get "/stats/weekly", StatController, :weekly
    get "/stats/monthly", StatController, :monthly
  end

  # Other scopes may use custom stacks.
  # scope "/api", GamecodeWeb do
  #   pipe_through :api
  # end
end
