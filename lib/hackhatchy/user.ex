defmodule Hackhatchy.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Pbkdf2

  schema "users" do
    field :email, :string
    field :password, :string
    field :username, :string
    has_many :bookmarks, Hackhatchy.Bookmark
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> hash_password
  end

  defp hash_password(%{valid?: true, changes: %{password: new_password}} = changeset) do
    put_change(changeset, :password, Pbkdf2.hashpwsalt(new_password))
  end
  defp hash_password(changeset), do: changeset
end
