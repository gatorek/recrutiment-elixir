defmodule GamecodeWeb.TripController do
  use GamecodeWeb, :controller
  alias Gamecode.Track

  def add(conn, params) do
    atom_params = Map.new(params, fn{k,v} -> {String.to_atom(k), v} end )
    track = struct(Track, atom_params)
    track = %{track |
      date: Date.from_iso8601!(track.date),
      distance: GamecodeWeb.DistanceService.get(track.start_address, track.destination_address)
    }
    status = Gamecode.Database.add_track(track)
    if (status == :ok) do
      GamecodeWeb.Endpoint.broadcast "event:updates", "add", %{trip_added: track}
    end
    response = %{status: status} |> Poison.encode!

    conn
      |> put_resp_header("content-type", "application/json")
      |> resp(200, response)
  end
end
