defmodule Whatismikedoingnow.GameDesign.Note do
  use Ecto.Schema
  import Ecto.Changeset
  alias Whatismikedoingnow.Accounts.User
  alias Whatismikedoingnow.GameDesign.Link

  schema "notes" do
    field :color, :integer
    field :text, :string
    field :x, :float
    field :y, :float
    belongs_to :user, User
    has_many :left_links, Link, [foreign_key: :left_note_id]
    has_many :right_links, Link, [foreign_key: :right_note_id]

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:text, :x, :y, :color])
    |> validate_required([:text, :x, :y, :color])
  end
end
