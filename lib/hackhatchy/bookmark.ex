defmodule Hackhatchy.Bookmark do
  use Ecto.Schema
  import Ecto.Changeset


  schema "bookmarks" do
    field :news_id, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(bookmark, attrs) do
    bookmark
    |> cast(attrs, [:user_id, :news_id])
    |> validate_required([:user_id, :news_id])
  end
end
