defmodule Whatismikedoingnow.Content.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Whatismikedoingnow.Accounts.User

  schema "comments" do
    field :body, :string
    field :content_item, :id
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
