defmodule WhatismikedoingnowWeb.Content.TypeResolver do
  def list(_root, _args, _info) do
    types = Content.list_types()
    {:ok, types}
  end

  def find(_root, %{id: id}, _info) do
    case Content.get_type(id) do
      nil ->
        {:error, "No type with that ID exists"}
      type ->
        {:ok, type}
    end
  end

  def create(_root, args, _info) do
    case Content.create_type(args) do
      {:ok, type} ->
        {:ok, type}
      _error ->
        {:error, "Could not create the type"}
    end
  end

  def update(_root, %{id: id, type: type_params}, _info) do
    case Content.get_type(id) do
      nil ->
        {:error, "No type with that ID exists to update"}
      type ->
        Content.update_type(type, type_params)
    end
  end

  def delete(_root, %{id: id}, _info) do
    case Content.get_type(id) do
      nil ->
        {:error, "No type with that ID exists to delete"}
      type ->
        Content.delete_type(type)
    end
  end
end
