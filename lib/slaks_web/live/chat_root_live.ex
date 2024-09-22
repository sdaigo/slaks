defmodule SlaksWeb.ChatRoomLive do
  use SlaksWeb, :live_view
  alias Slaks.Repo
  alias Slaks.Chat.Room

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <div class="flex flex-col flex-grow shadow-lg">
      <div class="flex justify-between items-center flex-shrink-0 h-16 bg-white border-b border-slate-300 px-4">
        <div class="flex flex-col gap-1.5">
          <h1 class="text-sm font-bold leading-none">
            #<%= @room.name %>
          </h1>
          <div class="text-xs leading-none h-3.5" phx-click="toggle-topic">
            <%= if @hide_topic? do %>
              <span class="text-slate-600">[Topic hidden]</span>
            <% else %>
              <%= @room.topic %>
            <% end %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  # opens websocket connection, performs initialization to first render the page
  def mount(_params, _session, socket) do
    room =
      Room
      |> Repo.all()
      |> List.first()

    {:ok, assign(socket, hide_topic?: false, room: room)}
  end

  def handle_event("toggle-topic", _params, socket) do
    {:noreply, update(socket, :hide_topic?, &(!&1))}
  end
end
