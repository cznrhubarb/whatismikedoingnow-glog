defmodule Whatismikedoingnow.Content.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Whatismikedoingnow.Content.Type
  alias Whatismikedoingnow.Content.Comment

  schema "items" do
    field :title, :string
    field :blurb, :string
    field :link, :string
    field :payload, :string
    field :thumbnail, :string
    belongs_to :type, Type
    has_many :comment, Comment

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :blurb, :link, :payload, :thumbnail])
    |> validate_required([:title, :blurb, :link, :payload, :thumbnail])
  end
end
