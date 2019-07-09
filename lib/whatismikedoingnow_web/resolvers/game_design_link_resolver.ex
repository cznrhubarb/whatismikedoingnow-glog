defmodule WhatismikedoingnowWeb.GameDesign.LinkResolver do
  alias Whatismikedoingnow.GameDesign
  alias Whatismikedoingnow.Accounts

  def list(_root, _args, _info) do
    links = GameDesign.list_links()
    {:ok, links}
  end

  def find(_root, %{id: id}, _info) do
    case GameDesign.get_link(id) do
      nil ->
        {:error, "No link with that ID exists"}
        link ->
        {:ok, link}
    end
  end

  def create(_root, args, _info) do
    #TODO: Need to ensure that both note ids exist as well
    case Accounts.get_user(args.user_id) do
      nil ->
        {:error, "No user exists with the user_id specified"}
      user ->
        link = Map.put(args, :user, user)
        {_, link} = Map.pop(link, :user_id)

        case GameDesign.create_link(link) do
          {:ok, link} ->
            {:ok, link}
          _error ->
            {:error, "Could not create the link"}
        end
    end
  end

  def update(_root, %{id: id, link: link_params}, _info) do
    case GameDesign.get_link(id) do
      nil ->
        {:error, "No link with that ID exists to update"}
      link ->
        GameDesign.update_link(link, link_params)
    end
  end

  def delete(_root, %{id: id}, _info) do
    case GameDesign.get_link(id) do
      nil ->
        {:error, "No link with that ID exists to delete"}
      link ->
        GameDesign.delete_link(link)
    end
  end
end
