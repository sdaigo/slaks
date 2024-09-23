# Context: Chat
defmodule Slaks.Chat do
  alias Slaks.Chat.Room
  alias Slaks.Repo

  def get_first_room! do
    [room | _] = list_rooms()
    room
  end

  def get_room!(id) do
    Repo.get!(Room, id)
  end

  def list_rooms do
    Room |> Repo.all()
  end
end
