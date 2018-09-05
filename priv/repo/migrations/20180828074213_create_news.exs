defmodule Hackhatchy.Repo.Migrations.CreateNews do
  use Ecto.Migration

  def change do
    create table(:news) do
      add :author, :string
      add :title, :string
      add :description, :string
      add :url, :string
      add :image, :string
      add :publishAt, :string

      timestamps()
    end

  end
end
