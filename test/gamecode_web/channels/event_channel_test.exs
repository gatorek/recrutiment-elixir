defmodule GamecodeWeb.EventChannelTest do
  use GamecodeWeb.ChannelCase

  alias GamecodeWeb.EventChannel

  setup do
    {:ok, _, socket} =
      socket("user_id", %{some: :assign})
      |> subscribe_and_join(EventChannel, "event:updates")

    {:ok, socket: socket}
  end

  test "add event to event:updates", %{socket: socket} do
    push socket, "add", %{"test" => "me"}
    assert_broadcast "event_added", %{"test" => "me"}
  end

  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from! socket, "broadcast", %{"some" => "data"}
    assert_push "broadcast", %{"some" => "data"}
  end
end
