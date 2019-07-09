defmodule Whatismikedoingnow.Repo.Migrations.RenameLinkReferencesFromAbToLeftright do
  use Ecto.Migration

  def change do
    rename table(:links), :note_a_id, to: :left_note_id
    rename table(:links), :note_b_id, to: :right_note_id
  end
end
