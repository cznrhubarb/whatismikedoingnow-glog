defmodule Whatismikedoingnow.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :string
      add :author, references(:users, on_delete: :nothing)
      add :content_item, references(:items, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:author])
    create index(:comments, [:content_item])
  end
end
