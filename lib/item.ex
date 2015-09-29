defmodule Item do
  @moduledoc """
  Item struct for a todo list and functions
  """

  defstruct name: nil, done: false

  @doc """
  Creates a new item

  ## PARAMETERS

  `name` - Name of todo item

  `done` - Mark if item is done or undone (optional)

  ## EXAMPLES

    Item.new("MyItem")
    %Item{done: false, name: "MyItem"}

    Item.new("Item done", true)
    %Item{done: true, name: "MyItem"}
  """
  def new(name, done \\ false) do
    %Item{name: name, done: done}
  end

  @doc """
  Mark a list of items as done

  ## PARAMETERS

  `list` - It's a list of items

  ## EXAMPLES

    Item.done([Item.new("MyItem")])
    [%Item{done: true, name: "MyItem"}]
  """
  def done(list) when is_list(list) do
    Enum.map(list, fn(item) ->
      done(item)
    end)
  end

  @doc """
  Mark a item as done

  ## PARAMETERS

  `item` - Item to mark as done (true)

  ## EXAMPLES

    Item.done(Item.new("MyItem"))
    %Item{done: true, name: "MyItem"}
  """
  def done(item) do
    %{item | done: true}
  end

  @doc """
  Mark a list of items as undone (false)

  ## PARAMETERS

  `list` - Its a list of items

  ## EXAMPLES

    Item.undone([Item.new("MyItem", true)])
    [%Item{done: false, name: "MyItem"}]
  """
  def undone(list) when is_list(list) do
    Enum.map(list, fn(item) ->
      undone(item)
    end)
  end

  @doc """
  Mark a item as undone

  ## PARAMETERS

  `item` - Item to mark as undone (false)

  ## EXAMPLES

    Item.undone(Item.new("MyItem", true))
    %Item{done: false, name: "MyItem"}
  """
  def undone(item) do
    %{item | done: false}
  end
end