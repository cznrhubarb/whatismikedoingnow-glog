defmodule WhatismikedoingnowWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias Whatismikedoingnow.GameDesign
  alias Whatismikedoingnow.Accounts

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :game_design_note do
    field :id, non_null(:id)
    field :text, non_null(:string)
    field :x, non_null(:float)
    field :y, non_null(:float)
    field :color, non_null(:integer)
    field :user, non_null(:user), resolve: dataloader(Accounts)
    field :left_links, non_null(list_of(:game_design_link)), resolve: dataloader(GameDesign)
    field :right_links, non_null(list_of(:game_design_link)), resolve: dataloader(GameDesign)
  end

  object :game_design_link do
    field :id, non_null(:id)
    field :text, :string
    #field :color, non_null(:integer) #TODO: Forgot to add color to the links. Gotta go back and do that
    field :user, non_null(:user), resolve: dataloader(Accounts)
    field :left_note, non_null(:game_design_note), resolve: dataloader(GameDesign)
    field :right_note, non_null(:game_design_note), resolve: dataloader(GameDesign)
  end

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :level, non_null(:integer)
    field :game_design_notes, non_null(list_of(:game_design_note)), resolve: dataloader(GameDesign)
    field :game_design_links, non_null(list_of(:game_design_link)), resolve: dataloader(GameDesign)
  end

  input_object :update_note_params do
    field :text, :string
    field :x, :float
    field :y, :float
    field :color, :integer
  end

  input_object :update_link_params do
    field :text, :string
    #TODO: Color
  end

  input_object :update_user_params do
    field :name, :string
    field :level, :integer
  end
end