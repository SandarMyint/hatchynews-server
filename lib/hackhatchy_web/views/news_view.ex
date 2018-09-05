defmodule HackhatchyWeb.NewsView do
    use HackhatchyWeb, :view

    alias HackhatchyWeb.NewsView

    def render("show.json", %{news: news}) do
        %{data: render_many(news, NewsView, "news.json")}
    end

    def render("index.json", %{news: news}) do
        %{data: render_one(news, NewsView, "news.json")}
    end

    def render("news.json", %{news: news}) do
        %{
            id: news.id,
            author: news.author,
            description: news.description,
            image: news.image,
            publishAt: news.publishAt,
            title: news.title,
            url: news.url
        }
    end
end