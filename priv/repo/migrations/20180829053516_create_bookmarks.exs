defmodule Hackhatchy.Repo.Migrations.CreateBookmarks do
  use Ecto.Migration

  def change do
    create table(:bookmarks) do
      add :user_id, references(:users)
      add :news_id, references(:news)

      timestamps()
    end

  end
end
