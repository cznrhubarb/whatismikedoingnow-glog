defmodule WhatismikedoingnowWeb.Accounts.UserResolver do
  alias Whatismikedoingnow.Accounts

  def list(_root, _args, _info) do
    users = Accounts.list_users()
    {:ok, users}
  end

  def find(_root, %{id: id}, _info) do
    case Accounts.get_user(id) do
      nil ->
        {:error, "No user with that ID exists"}
      user ->
        {:ok, user}
    end
  end

  def create(_root, args, _info) do
    case Accounts.create_user(Map.put(args, :level, 1)) do
      {:ok, user} ->
        {:ok, user}
      _error ->
        {:error, "Could not create the user"}
    end
  end

  def update(_root, %{id: id, user: user_params}, _info) do
    case Accounts.get_user(id) do
      nil ->
        {:error, "No user with that ID exists to update"}
      user ->
        Accounts.update_user(user, user_params)
    end
  end

  def delete(_root, %{id: id}, _info) do
    case Accounts.get_user(id) do
      nil ->
        {:error, "No user with that ID exists to delete"}
      user ->
        Accounts.delete_user(user)
    end
  end
end
