defmodule HackhatchyWeb.UserView do
    use HackhatchyWeb, :view

    alias HackhatchyWeb.UserView
    
    def render("show.json", %{users: users}) do
        %{data: render_many(users, UserView, "user.json")}
    end

    def render("index.json", %{user: user}) do
        %{data: render_one(user, UserView, "user.json")}
    end
    
    def render("user.json", %{user: user}) do
        %{
            id: user.id,
            username: user.username,
            email: user.email
        }
    end
end