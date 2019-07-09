defmodule Whatismikedoingnow.Repo.Migrations.RemoveOldTables do
  use Ecto.Migration

  def change do
    drop table(:game_design_notes)
    drop table(:users)
  end
end
