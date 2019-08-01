defmodule Whatismikedoingnow.Repo.Migrations.ChangeContentTypeIconsToString do
  use Ecto.Migration

  def change do
    alter table(:types) do
      modify :icon, :string
    end
  end
end
