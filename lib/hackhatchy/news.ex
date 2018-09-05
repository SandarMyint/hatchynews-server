defmodule Hackhatchy.News do
  use Ecto.Schema
  import Ecto.Changeset


  schema "news" do
    field :author, :string
    field :description, :string
    field :image, :string
    field :publishAt, :string
    field :title, :string
    field :url, :string
    has_many :bookmarks, Hackhatchy.Bookmark

    timestamps()
  end

  @doc false
  def changeset(news, attrs) do
    news
    |> cast(attrs, [:author, :title, :description, :url, :image, :publishAt])
  end
end
