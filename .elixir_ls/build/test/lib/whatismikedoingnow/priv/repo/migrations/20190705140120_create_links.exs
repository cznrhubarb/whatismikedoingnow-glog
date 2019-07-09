defmodule Whatismikedoingnow.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :text, :string
      add :user, references(:users, on_delete: :nothing), null: false
      add :note_a, references(:notes, on_delete: :delete_all), null: false
      add :note_b, references(:notes, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:links, [:user])
    create index(:links, [:note_a])
    create index(:links, [:note_b])
  end
end
