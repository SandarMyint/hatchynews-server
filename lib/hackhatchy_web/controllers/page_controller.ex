defmodule HackhatchyWeb.PageController do
  use HackhatchyWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
