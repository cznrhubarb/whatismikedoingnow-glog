defmodule Whatismikedoingnow.Repo.Migrations.RenameLinkReferenceFields do
  use Ecto.Migration

  def change do
    rename table(:links), :user, to: :user_id
    rename table(:links), :note_a, to: :note_a_id
    rename table(:links), :note_b, to: :note_b_id
  end
end
