defmodule PorkchopWeb.Router do
  use PorkchopWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admin do
    plug PorkchopWeb.Plugs.AdminLayout
    plug PorkchopWeb.Plugs.LoadAdmin
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PorkchopWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/admin", PorkchopWeb.Admin, as: :admin do
    pipe_through [:browser, :admin]

    # Add all routes that don't require admin authentication
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    # post "/sendlink", SessionController, :send_link
    # get "/magiclink", SessionController, :create
  end

  scope "/admin", PorkchopWeb.Admin, as: :admin do
    pipe_through [:browser, :admin, PorkchopWeb.Plugs.AuthenticateAdmin]

    # Add all routes that require admin authentication
    get "/", DashboardController, :show
    get "/logout", SessionController, :delete
  end

end
