defmodule Whatismikedoingnow.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :blurb, :string
      add :link, :string
      add :payload, :string
      add :thumbnail, :string
      add :type_id, references(:types, on_delete: :nothing)

      timestamps()
    end

    create index(:items, [:type_id])
  end
end
