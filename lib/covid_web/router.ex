defmodule CovidWeb.Router do
  use CovidWeb, :router

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

  scope "/", CovidWeb do
    pipe_through :browser

    get "/", VirusController, :index
    get "/viruses", VirusController, :index
    get "/viruses/:code/edit", VirusController, :edit
    get "/viruses/new", VirusController, :new
    get "/viruses/:code", VirusController, :show
    post "/viruses", VirusController, :create
    put "/viruses/:code", VirusController, :update
  end

  # Other scopes may use custom stacks.
  # scope "/api", CovidWeb do
  #   pipe_through :api
  # end
end
