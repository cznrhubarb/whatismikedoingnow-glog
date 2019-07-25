defmodule Whatismikedoingnow.ContentTest do
  use Whatismikedoingnow.DataCase

  alias Whatismikedoingnow.Content

  describe "types" do
    alias Whatismikedoingnow.Content.Type

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def type_fixture(attrs \\ %{}) do
      {:ok, type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_type()

      type
    end

    test "list_types/0 returns all types" do
      type = type_fixture()
      assert Content.list_types() == [type]
    end

    test "get_type!/1 returns the type with given id" do
      type = type_fixture()
      assert Content.get_type!(type.id) == type
    end

    test "create_type/1 with valid data creates a type" do
      assert {:ok, %Type{} = type} = Content.create_type(@valid_attrs)
      assert type.name == "some name"
    end

    test "create_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_type(@invalid_attrs)
    end

    test "update_type/2 with valid data updates the type" do
      type = type_fixture()
      assert {:ok, %Type{} = type} = Content.update_type(type, @update_attrs)
      assert type.name == "some updated name"
    end

    test "update_type/2 with invalid data returns error changeset" do
      type = type_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_type(type, @invalid_attrs)
      assert type == Content.get_type!(type.id)
    end

    test "delete_type/1 deletes the type" do
      type = type_fixture()
      assert {:ok, %Type{}} = Content.delete_type(type)
      assert_raise Ecto.NoResultsError, fn -> Content.get_type!(type.id) end
    end

    test "change_type/1 returns a type changeset" do
      type = type_fixture()
      assert %Ecto.Changeset{} = Content.change_type(type)
    end
  end

  describe "items" do
    alias Whatismikedoingnow.Content.Item

    @valid_attrs %{blurb: "some blurb", link: "some link", payload: "some payload", thumbnail: "some thumbnail"}
    @update_attrs %{blurb: "some updated blurb", link: "some updated link", payload: "some updated payload", thumbnail: "some updated thumbnail"}
    @invalid_attrs %{blurb: nil, link: nil, payload: nil, thumbnail: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Content.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Content.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Content.create_item(@valid_attrs)
      assert item.blurb == "some blurb"
      assert item.link == "some link"
      assert item.payload == "some payload"
      assert item.thumbnail == "some thumbnail"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Content.update_item(item, @update_attrs)
      assert item.blurb == "some updated blurb"
      assert item.link == "some updated link"
      assert item.payload == "some updated payload"
      assert item.thumbnail == "some updated thumbnail"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_item(item, @invalid_attrs)
      assert item == Content.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Content.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Content.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Content.change_item(item)
    end
  end

  describe "comments" do
    alias Whatismikedoingnow.Content.Comment

    @valid_attrs %{body: "some body"}
    @update_attrs %{body: "some updated body"}
    @invalid_attrs %{body: nil}

    def comment_fixture(attrs \\ %{}) do
      {:ok, comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_comment()

      comment
    end

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Content.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Content.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      assert {:ok, %Comment{} = comment} = Content.create_comment(@valid_attrs)
      assert comment.body == "some body"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{} = comment} = Content.update_comment(comment, @update_attrs)
      assert comment.body == "some updated body"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_comment(comment, @invalid_attrs)
      assert comment == Content.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Content.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Content.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Content.change_comment(comment)
    end
  end
end
