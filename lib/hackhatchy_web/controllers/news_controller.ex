defmodule HackhatchyWeb.NewsController do
    use HackhatchyWeb, :controller

    alias Hackhatchy.User
    alias Hackhatchy.News
    alias Hackhatchy.Bookmark
    alias Hackhatchy.Repo
    alias Hackhatchy.Service

    import Ecto.Query

    def bookmark(conn, %{"user_id" => user_id, "params" => news_params}) do
        # Service.create_news(news_params)
        case Service.create_news(news_params) do
          {:ok, news} ->
            case Service.create_bookmark(%{"user_id" => user_id, "news_id" => news.id}) do
              {:error, error} ->
                conn
                |> json(%{status: "Bookmark Fail"})
              {:ok, user} ->
                conn
                |> json(%{status: "Bookmark Complete"})
            end
          
          {:error, _} ->
            conn
            |> json(%{status: "Bookmark Fail"})
        end
        # conn |> json(%{status: "bookmark function"})
      end
  
      def unbookmark(conn, %{"user_id" => user_id, "params" => %{"title" => title}}) do
        news_id = Service.get_news(%{title: title}).id
        
        Service.delete_bookmark(Service.get_bookmark(%{news_id: news_id, user_id: user_id}))
  
        if Service.get_bookmark(%{news_id: news_id}) == nil do
          Service.delete_news(Service.get_news(%{id: news_id}))
        end
  
        conn
        |> json(%{status: "Unbookmark Complete"})
      end
  
      def get_bookmarks(conn, %{"user_id" => user_id}) do
        query = from n in News, inner_join: b in Bookmark, on: n.id == b.news_id,
                where: b.user_id == ^user_id
        news = Repo.all(query)
        IO.inspect news
        
        render(conn, "show.json", news: news)
      end
end