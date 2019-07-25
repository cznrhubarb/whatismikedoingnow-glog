defmodule Whatismikedoingnow.Content.Type do
  use Ecto.Schema
  import Ecto.Changeset
  alias Whatismikedoingnow.Content.Item

  schema "types" do
    field :name, :string
    field :icon, :binary
    has_many :item, Item

    timestamps()
  end

  @doc false
  def changeset(type, attrs) do
    type
    |> cast(attrs, [:name, :icon])
    |> validate_required([:name, :icon])
  end
end
