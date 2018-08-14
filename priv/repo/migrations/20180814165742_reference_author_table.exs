defmodule Porkchop.Repo.Migrations.ReferenceAuthorTable do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      remove :author
      add :author_id, references(:authors)
    end
  end
end
