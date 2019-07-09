defmodule Whatismikedoingnow.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :text, :string
      add :x, :float
      add :y, :float
      add :color, :integer

      timestamps()
    end

  end
end
