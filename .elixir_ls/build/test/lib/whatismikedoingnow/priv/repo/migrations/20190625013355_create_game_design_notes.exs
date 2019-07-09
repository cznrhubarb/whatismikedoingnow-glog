defmodule Whatismikedoingnow.Repo.Migrations.CreateGameDesignNotes do
  use Ecto.Migration

  def change do
    create table(:game_design_notes) do
      add :text, :string, null: false
      add :x_pos, :float, null: false
      add :y_pos, :float, null: false
      add :color, :integer, default: 0xf1d592
    end
  end
end
