defmodule CommunityProjects.Router do
  use CommunityProjects.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CommunityProjects do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/projects", ProjectController
  end

  # Other scopes may use custom stacks.
  # scope "/api", CommunityProjects do
  #   pipe_through :api
  # end
end
