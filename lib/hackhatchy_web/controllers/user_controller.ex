defmodule HackhatchyWeb.UserController do
    use HackhatchyWeb, :controller
  
    alias Hackhatchy.User
    alias Hackhatchy.News
    alias Hackhatchy.Bookmark
    alias Hackhatchy.Repo
    alias Hackhatchy.Service
    
    import Ecto.Query

    def index(conn, _params) do
      render conn, "index.html"
    end

    def signup(conn, %{"params" => user_params}) do
        case Service.create_user(user_params) do
          {:error, error} ->
            conn
            |> json(%{ status: "Sign Up Fail"})
          {:ok, user} ->
            render(conn, "index.json", user: user)
        end
    end

    def signin(conn, %{"params" => %{"email" => email, "password" => password}}) do
      case Service.authenticate(%{email: email}, password) do
        {:error, error} -> 
          conn 
          |> json(%{status: error})
        {:ok, user} -> 
          render(conn, "index.json", user: user)
      end
    end
  end
  