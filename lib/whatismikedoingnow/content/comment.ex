defmodule Whatismikedoingnow.Content.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Whatismikedoingnow.Content.Item
  alias Whatismikedoingnow.Accounts.User

  schema "comments" do
    field :body, :string
    belongs_to :content_item, Item
    belongs_to :author, User

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
