defmodule WhatismikedoingnowWeb.Content.CommentResolver do
  alias Whatismikedoingnow.Accounts

  def list(_root, _args, _info) do
    comments = Content.list_comments()
    {:ok, comments}
  end

  def find(_root, %{id: id}, _info) do
    case Content.get_comment(id) do
      nil ->
        {:error, "No comment with that ID exists"}
        comment ->
        {:ok, comment}
    end
  end

  def create(_root, args, _info) do
    #TODO: Need to ensure that the content id exists as well
    case Accounts.get_user(args.user_id) do
      nil ->
        {:error, "No user exists with the user_id specified"}
      user ->
        comment = Map.put(args, :user, user)
        {_, comment} = Map.pop(comment, :user_id)

        case Content.create_comment(comment) do
          {:ok, comment} ->
            {:ok, comment}
          _error ->
            {:error, "Could not create the comment"}
        end
    end
  end

  def update(_root, %{id: id, comment: comment_params}, _info) do
    case Content.get_comment(id) do
      nil ->
        {:error, "No comment with that ID exists to update"}
      comment ->
        Content.update_comment(comment, comment_params)
    end
  end

  def delete(_root, %{id: id}, _info) do
    case Content.get_comment(id) do
      nil ->
        {:error, "No comment with that ID exists to delete"}
      comment ->
        Content.delete_comment(comment)
    end
  end
end
