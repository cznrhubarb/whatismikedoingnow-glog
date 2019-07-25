defmodule Whatismikedoingnow.Repo.Migrations.CreateTypes do
  use Ecto.Migration

  def change do
    create table(:types) do
      add :name, :string
      add :icon, :binary

      timestamps()
    end

  end
end
