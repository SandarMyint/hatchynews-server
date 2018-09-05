defmodule Hackhatchy.Service do

    alias Hackhatchy.User
    alias Hackhatchy.News
    alias Hackhatchy.Bookmark
    alias Hackhatchy.Repo
    alias Comeonin.Pbkdf2
    import Ecto.Changeset

    def create_user(params \\ %{}) do
        %User{}
        |> User.changeset(params)
        |> Repo.insert()
    end

    def authenticate(%{email: email}, password) do
        User
        |> Repo.get_by(%{email: String.downcase(email)})
        |> check_password(password)
    end
  
    def check_password(nil, _), do: {:error, "There is no user with that email"}
  
    def check_password(user, password) do
        case Pbkdf2.checkpw(password, user.password) do
            true -> {:ok, user}
            false -> {:error, "Incorrect Password"}
        end
    end

    def create_news(params \\ %{}) do
        %News{}
        |> News.changeset(params)
        |> Repo.insert
    end

    def get_news(params \\ %{}) do
        Repo.get_by(News, params)
    end

    def delete_news(%News{} = news) do
        Repo.delete(news)
    end

    def create_bookmark(params \\ %{}) do
        %Bookmark{}
        |> Bookmark.changeset(params)
        |> Repo.insert
    end

    def delete_bookmark(%Bookmark{} = bookmark) do
        Repo.delete(bookmark)
    end

    def get_bookmark(params \\ %{}) do
        Repo.get_by(Bookmark, params)
    end
end