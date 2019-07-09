defmodule Whatismikedoingnow.Repo.Migrations.AddUserToNotesAgain do
  use Ecto.Migration

  def change do
    alter table(:notes) do
      add :user_id, references(:users), null: false, default: 1
    end
  end
end
