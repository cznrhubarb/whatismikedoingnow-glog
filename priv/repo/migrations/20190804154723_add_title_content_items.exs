defmodule Whatismikedoingnow.Repo.Migrations.AddTitleContentItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :title, :string, null: false, default: "Title"
    end
  end
end
