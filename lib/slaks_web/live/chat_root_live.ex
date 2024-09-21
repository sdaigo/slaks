defmodule SlaksWeb.ChatRoomLive do
  use SlaksWeb, :live_view

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <div>Welcome to the chat</div>
    """
  end
end
