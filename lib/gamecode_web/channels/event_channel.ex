defmodule GamecodeWeb.EventChannel do
  use Phoenix.Channel

  def join(_any, _msg, socket) do
    {:ok, socket}
  end


  def handle_in("add", msg, socket) do
    broadcast socket, "event_added", msg
    {:noreply, socket}
  end

end
