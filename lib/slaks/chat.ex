# Chat Context
defmodule Slaks.Chat do
  alias Slaks.Chat.{Message, Room}
  alias Slaks.Repo

  import Ecto.Query

  def change_room(room, attrs \\ %{}) do
    Room.changeset(room, attrs)
  end

  def create_room(attrs) do
    %Room{}
    |> Room.changeset(attrs)
    |> Repo.insert()
  end

  def update_room(%Room{} = room, attrs) do
    room
    |> Room.changeset(attrs)
    |> Repo.update()
  end

  def get_first_room! do
    Repo.one!(from r in Room, limit: 1, order_by: [asc: :name])
  end

  def get_room!(id) do
    Repo.get!(Room, id)
  end

  def list_rooms do
    Repo.all(from r in Room, order_by: [asc: :name])
  end

  def list_messages_in_room(%Room{id: room_id}) do
    from(m in Message,
      where: m.room_id == ^room_id,
      order_by: [asc: :inserted_at, asc: :id]
    )
    |> Repo.all()
  end
end
