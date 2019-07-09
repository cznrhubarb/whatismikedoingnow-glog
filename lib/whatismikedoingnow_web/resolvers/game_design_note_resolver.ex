defmodule WhatismikedoingnowWeb.GameDesign.NoteResolver do
  alias Whatismikedoingnow.GameDesign
  alias Whatismikedoingnow.Accounts

  def list(_root, _args, _info) do
    notes = GameDesign.list_notes()
    {:ok, notes}
  end

  def find(_root, %{id: id}, _info) do
    case GameDesign.get_note(id) do
      nil ->
        {:error, "No note with that ID exists"}
      note ->
        {:ok, note}
    end
  end

  def create(_root, args, _info) do
    case Accounts.get_user(args.user_id) do
      nil ->
        {:error, "No user exists with the user_id specified"}
      user ->
        note = Map.put(args, :user, user)
        {_, note} = Map.pop(note, :user_id)

        case GameDesign.create_note(note) do
          {:ok, note} ->
            {:ok, note}
          _error ->
            {:error, "Could not create the note"}
        end
    end
  end

  def update(_root, %{id: id, note: note_params}, _info) do
    case GameDesign.get_note(id) do
      nil ->
        {:error, "No note with that ID exists to update"}
      note ->
        GameDesign.update_note(note, note_params)
    end
  end

  def delete(_root, %{id: id}, _info) do
    case GameDesign.get_note(id) do
      nil ->
        {:error, "No note with that ID exists to delete"}
      note ->
        GameDesign.delete_note(note)
    end
  end
end
