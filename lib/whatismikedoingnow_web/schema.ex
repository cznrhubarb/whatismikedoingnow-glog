defmodule WhatismikedoingnowWeb.Schema do
  use Absinthe.Schema

  import_types WhatismikedoingnowWeb.Schema.Types

  alias Whatismikedoingnow.GameDesign
  alias WhatismikedoingnowWeb.GameDesign.NoteResolver
  alias WhatismikedoingnowWeb.GameDesign.LinkResolver
  alias Whatismikedoingnow.Accounts
  alias WhatismikedoingnowWeb.Accounts.UserResolver

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(GameDesign, GameDesign.data())
      |> Dataloader.add_source(Accounts, Accounts.data())

      Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults() ]
  end

  query do
    field :game_design_notes, non_null(list_of(non_null(:game_design_note))) do
      resolve &NoteResolver.list/3
    end

    field :game_design_note, :game_design_note do
      arg :id, non_null(:id)

      resolve &NoteResolver.find/3
    end

    field :game_design_links, non_null(list_of(non_null(:game_design_link))) do
      resolve &LinkResolver.list/3
    end

    field :game_design_link, :game_design_link do
      arg :id, non_null(:id)

      resolve &LinkResolver.find/3
    end

    field :users, non_null(list_of(non_null(:user))) do
      resolve &UserResolver.list/3
    end

    field :user, :user do
      arg :id, non_null(:id)

      resolve &UserResolver.find/3
    end
  end

  mutation do
    field :create_game_design_note, :game_design_note do
      arg :text, non_null(:string)
      arg :x, non_null(:float)
      arg :y, non_null(:float)
      arg :user_id, non_null(:id)
      arg :color, :integer, default_value: 0xffffff

      resolve &NoteResolver.create/3
    end

    field :update_game_design_note, :game_design_note do
      arg :id, non_null(:id)
      arg :note, :update_note_params

      resolve &NoteResolver.update/3
    end

    field :delete_game_design_note, :game_design_note do
      arg :id, non_null(:id)

      resolve &NoteResolver.delete/3
    end

    field :create_game_design_link, :game_design_link do
      arg :text, :string
      arg :user_id, non_null(:id)
      arg :left_note_id, non_null(:id)
      arg :right_note_id, non_null(:id)
      #arg :color, :integer, default_value: 0xffffff #TODO

      resolve &LinkResolver.create/3
    end

    field :update_game_design_link, :game_design_link do
      arg :id, non_null(:id)
      arg :link, :update_link_params

      resolve &LinkResolver.update/3
    end

    field :delete_game_design_link, :game_design_link do
      arg :id, non_null(:id)

      resolve &LinkResolver.delete/3
    end

    field :create_user, :user do
      arg :name, non_null(:string)
      #level defaults to 1

      resolve &UserResolver.create/3
    end

    field :update_user, :user do
      arg :id, non_null(:id)
      arg :user, :update_user_params

      resolve &UserResolver.update/3
    end

    field :delete_user, :user do
      arg :id, non_null(:id)

      resolve &UserResolver.delete/3
    end
  end
end
