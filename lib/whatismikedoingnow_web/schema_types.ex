defmodule WhatismikedoingnowWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias Whatismikedoingnow.GameDesign
  alias Whatismikedoingnow.Accounts
  alias Whatismikedoingnow.Content

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
    field :content_comments, non_null(list_of(:content_comment)), resolve: dataloader(Content)
  end

  object :content_type do
    field :name, non_null(:string)
    #TODO: Gonna need to switch this to a URL string as well (or base64 encode the binary?)
    #field :icon, non_null(:binary)
    field :content_items, non_null(list_of(:content_item)), resolve: dataloader(Content)
  end

  object :content_item do
    field :blurb, non_null(:string)
    field :link, :string
    field :payload, :string
    field :thumbnail, :string
    field :type, non_null(:content_type), resolve: dataloader(Content)
  end

  object :content_comment do
    field :body, non_null(:string)
    field :content_item, non_null(:id)
    field :author, non_null(:user), resolve: dataloader(Accounts)
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

  input_object :update_content_type_params do
    field :name, :string
    #TODO: Gonna need to switch this to a URL string as well (or base64 encode the binary?)
    #field :icon, :binary
  end

  input_object :update_content_item_params do
    field :blurb, :string
    field :link, :string
    field :payload, :string
    field :thumbnail, :string
    # Should you be able to change the type?
    #field :type, :content_type
  end

  input_object :update_content_comment_params do
    field :body, :string
  end
end