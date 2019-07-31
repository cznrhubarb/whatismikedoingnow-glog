defmodule WhatismikedoingnowWeb.Content.ItemResolver do
  alias Whatismikedoingnow.Content
  
    def list(_root, _args, _info) do
      items = Content.list_items()
      {:ok, items}
    end
  
    def find(_root, %{id: id}, _info) do
      case Content.get_item(id) do
        nil ->
          {:error, "No item with that ID exists"}
        item ->
          {:ok, item}
      end
    end
  
    def create(_root, args, _info) do
      case Content.create_item(args) do
        {:ok, item} ->
          {:ok, item}
        _error ->
          {:error, "Could not create the item"}
      end
    end
  
    def update(_root, %{id: id, item: item_params}, _info) do
      case Content.get_item(id) do
        nil ->
          {:error, "No item with that ID exists to update"}
        item ->
          Content.update_item(item, item_params)
      end
    end
  
    def delete(_root, %{id: id}, _info) do
      case Content.get_item(id) do
        nil ->
          {:error, "No item with that ID exists to delete"}
        item ->
          Content.delete_item(item)
      end
    end
  end
  