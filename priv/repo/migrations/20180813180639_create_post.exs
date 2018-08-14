defmodule Porkchop.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :slug, :string
      add :author, :string
      add :category, :string
      add :post_date, :date, default: fragment("current_date")

      timestamps()
    end
  end
end
