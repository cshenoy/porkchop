defmodule Porkchop.Library.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Porkchop.Library.Post

  schema "posts" do
    field :title, :string
    field :body, :string
    field :slug, :string
    field :author, :string
    field :category, :string
    field :post_date, :date

    timestamps()
  end

  @doc false
  def changeset(%Post{} = customer, attrs) do
    customer
    |> cast(attrs, [:title, :body, :slug])
    |> validate_required([:title, :body, :slug])
    |> validate_format(:slug, ~r/^[a-z0-9]+(?:-[a-z0-9]+)*$/, message: "is invalid")
    |> unique_constraint(:slug)
  end
end