defmodule Whatismikedoingnow.GameDesignTest do
  use Whatismikedoingnow.DataCase

  alias Whatismikedoingnow.GameDesign

  describe "notes" do
    alias Whatismikedoingnow.GameDesign.Note

    @valid_attrs %{color: 42, text: "some text", x: 120.5, y: 120.5}
    @update_attrs %{color: 43, text: "some updated text", x: 456.7, y: 456.7}
    @invalid_attrs %{color: nil, text: nil, x: nil, y: nil}

    def note_fixture(attrs \\ %{}) do
      {:ok, note} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GameDesign.create_note()

      note
    end

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert GameDesign.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert GameDesign.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      assert {:ok, %Note{} = note} = GameDesign.create_note(@valid_attrs)
      assert note.color == 42
      assert note.text == "some text"
      assert note.x == 120.5
      assert note.y == 120.5
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameDesign.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      assert {:ok, %Note{} = note} = GameDesign.update_note(note, @update_attrs)
      assert note.color == 43
      assert note.text == "some updated text"
      assert note.x == 456.7
      assert note.y == 456.7
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = GameDesign.update_note(note, @invalid_attrs)
      assert note == GameDesign.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = GameDesign.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> GameDesign.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = GameDesign.change_note(note)
    end
  end

  describe "links" do
    alias Whatismikedoingnow.GameDesign.Link

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def link_fixture(attrs \\ %{}) do
      {:ok, link} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GameDesign.create_link()

      link
    end

    test "list_links/0 returns all links" do
      link = link_fixture()
      assert GameDesign.list_links() == [link]
    end

    test "get_link!/1 returns the link with given id" do
      link = link_fixture()
      assert GameDesign.get_link!(link.id) == link
    end

    test "create_link/1 with valid data creates a link" do
      assert {:ok, %Link{} = link} = GameDesign.create_link(@valid_attrs)
      assert link.text == "some text"
    end

    test "create_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameDesign.create_link(@invalid_attrs)
    end

    test "update_link/2 with valid data updates the link" do
      link = link_fixture()
      assert {:ok, %Link{} = link} = GameDesign.update_link(link, @update_attrs)
      assert link.text == "some updated text"
    end

    test "update_link/2 with invalid data returns error changeset" do
      link = link_fixture()
      assert {:error, %Ecto.Changeset{}} = GameDesign.update_link(link, @invalid_attrs)
      assert link == GameDesign.get_link!(link.id)
    end

    test "delete_link/1 deletes the link" do
      link = link_fixture()
      assert {:ok, %Link{}} = GameDesign.delete_link(link)
      assert_raise Ecto.NoResultsError, fn -> GameDesign.get_link!(link.id) end
    end

    test "change_link/1 returns a link changeset" do
      link = link_fixture()
      assert %Ecto.Changeset{} = GameDesign.change_link(link)
    end
  end
end
