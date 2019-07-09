defmodule Whatismikedoingnow.GameDesign.Link do
  use Ecto.Schema
  import Ecto.Changeset
  alias Whatismikedoingnow.Accounts.User
  alias Whatismikedoingnow.GameDesign.Note

  schema "links" do
    field :text, :string
    belongs_to :user, User
    belongs_to :left_note, Note
    belongs_to :right_note, Note

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
