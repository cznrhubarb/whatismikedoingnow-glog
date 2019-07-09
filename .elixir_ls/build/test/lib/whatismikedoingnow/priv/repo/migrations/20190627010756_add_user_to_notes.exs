defmodule Whatismikedoingnow.Repo.Migrations.AddUserToNotes do
  use Ecto.Migration

  def change do
    alter table(:game_design_notes) do
      add :user_id, references(:users)

      timestamps
    end
  end
end
