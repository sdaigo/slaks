# Chat Context
defmodule Slaks.Chat do
  alias Slaks.Chat.Room
  alias Slaks.Repo

  import Ecto.Query

  def get_first_room! do
    Repo.one!(from r in Room, limit: 1, order_by: [asc: :name])
  end

  def get_room!(id) do
    Repo.get!(Room, id)
  end

  def list_rooms do
    Repo.all(from r in Room, order_by: [asc: :name])
  end
end
