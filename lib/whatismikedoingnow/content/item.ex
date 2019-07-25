defmodule Whatismikedoingnow.Content.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Whatismikedoingnow.Content.Type

  schema "items" do
    field :blurb, :string
    field :link, :string
    field :payload, :string
    field :thumbnail, :string
    belongs_to :type, Type

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:blurb, :link, :payload, :thumbnail])
    |> validate_required([:blurb, :link, :payload, :thumbnail])
  end
end
