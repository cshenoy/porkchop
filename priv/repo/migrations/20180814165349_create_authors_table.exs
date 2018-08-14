defmodule Porkchop.Repo.Migrations.CreateAuthorsTable do
  use Ecto.Migration

  def change do
    # a PostgreSQL column type for storing case insensitive strings
    execute "CREATE EXTENSION IF NOT EXISTS citext"
    create table(:authors) do
      add :email, :citext
      add :name, :string
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:authors, [:email])
  end
end
