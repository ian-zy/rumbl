defmodule Rumbl.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.Users.User

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :username, :password])
    |> validate_required([:name, :username, :password])
    |> validate_length(:username, min: 1, max: 20)
  end
end
