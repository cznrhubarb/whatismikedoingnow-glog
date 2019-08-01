defmodule Whatismikedoingnow.Repo.Migrations.ChangeAuthorAndItemToIdInComments do
  use Ecto.Migration

  def change do
    rename table(:comments), :author, to: :author_id
    rename table(:comments), :content_item, to: :content_item_id
  end
end
