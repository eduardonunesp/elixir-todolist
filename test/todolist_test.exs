defmodule TodolistTest do
  use ExUnit.Case

  test "Create an item" do
    assert %{done: _, name: _} = Item.new("Wash the house")
  end

  test "Mark item as done" do
    item = Item.new("My todo", true)
    assert %{done: true, name: _} = item

    item = Item.new("Another todo")
    item = Item.done(item)
    assert %{done: true, name: _} = item
  end

  test "Mark item as undone" do
    item = Item.new("My todo", false)
    assert %{done: false, name: _} = item

    item = Item.new("Another todo", true)
    item = Item.undone(item)
    assert %{done: false, name: _} = item
  end

  test "Mark a list of items as done" do
    items = [Item.new("Item 1"), Item.new("Item 2")]
    items = Item.done(items)

    Enum.each(items, fn(i) ->
      assert %{done: true, name: _} = i
    end)
  end

  test "Mark a list of items as undone" do
    items = [Item.new("Item 1", true), Item.new("Item 2", true)]
    items = Item.undone(items)

    Enum.each(items, fn(i) ->
      assert %{done: false, name: _} = i
    end)
  end
end
