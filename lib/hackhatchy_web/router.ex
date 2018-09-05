defmodule HackhatchyWeb.Router do
  use HackhatchyWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/", HackhatchyWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

  end

  # Other scopes may use custom stacks.
  scope "/", HackhatchyWeb do
    pipe_through :api

    options "/user/signup", UserController, :signup
    options "/user/signin", UserController, :signin

    options "/:user_id/bookmark", NewsController, :bookmark
    options "/:user_id/unbookmark", NewsController, :unbookmark

    options "/:user_id/getBookmarks", NewsController, :get_bookmarks

    post "/user/signup", UserController, :signup
    post "/user/signin", UserController, :signin
    
    post "/:user_id/bookmark", NewsController, :bookmark
    post "/:user_id/unbookmark", NewsController, :unbookmark

    get "/:user_id/getBookmarks", NewsController, :get_bookmarks
  end
end
