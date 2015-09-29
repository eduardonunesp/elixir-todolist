defmodule Todo do
  @moduledoc """
  Todo list manager and todo items
  """
  defstruct name: nil, items: []

  @doc """
  Create a new todo list

  ## PARAMETERS

  `name` - Name of todo list

  ## EXAMPLES

    Todo.new("Todo list")
    %Todo{list:[], name: "Todo list"}
  """
  def new(name) do
    %Todo{name: name, items: []}
  end

  def new_item(%{items: i, name: n}, item_name, done \\ false) do
    item = Item.new(item_name, done)
    new(n, Enum.reverse([item | i]))
  end

  # Auxiliar function for new_item function
  defp new(name, items) do
    %Todo{name: name, items: items}
  end

  @doc """
  Set all items at todo as done
  """
  def all_done(%{items: i, name: n}) do
    new(n, Item.done(i))
  end

  @doc """
  Set all items at todo as undone
  """
  def all_undone(%{items: i, name: n}) do
    new(n, Item.undone(i))
  end
end