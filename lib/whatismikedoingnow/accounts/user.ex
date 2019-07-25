defmodule Whatismikedoingnow.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Whatismikedoingnow.GameDesign.Note
  alias Whatismikedoingnow.GameDesign.Link
  alias Whatismikedoingnow.Content.Comment

  schema "users" do
    field :level, :integer
    field :name, :string
    has_many :game_design_notes, Note
    has_many :game_design_links, Link
    has_many :content_comments, Comment, foreign_key: :author_id

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :level])
    |> validate_required([:name, :level])
    |> unique_constraint(:name)
  end
end
