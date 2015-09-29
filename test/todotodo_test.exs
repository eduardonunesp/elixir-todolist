defmodule TodotodoTest do
  use ExUnit.Case

  test "Create an todo" do
    assert %{name: _, items: []} = Todo.new("Todo list")
  end

  test "Create todo with item" do
    t = Todo.new("Todo list")
    t = Todo.new_item(t, "New task")
    assert length(t.items) == 1
  end

  test "Make all items of a todo done" do
    t = Todo.new("Todo list")
    t = Todo.new_item(t, "New task 1")
    t = Todo.new_item(t, "New task 2")
    t = Todo.all_done(t)
    Enum.each(t.items, fn(i) ->
      assert %{done: true, name: _} = i
    end)
  end

  test "Make all items of a todo undone" do
    t = Todo.new("Todo list")
    t = Todo.new_item(t, "New task 1", true)
    t = Todo.new_item(t, "New task 2", true)
    t = Todo.all_undone(t)
    Enum.each(t.items, fn(i) ->
      assert %{done: false, name: _} = i
    end)
  end
end
