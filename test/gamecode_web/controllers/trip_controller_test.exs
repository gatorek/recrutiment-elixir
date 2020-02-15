defmodule GamecodeWeb.TripControllerTest do
  use GamecodeWeb.ConnCase

  test "POST /api/trips", %{conn: conn} do
    data = %{
      start_address: "Plac Konesera 8, Warszawa",
      destination_address: "Świeradowska 47, Warszawa",
      price: 20.2,
      date: "2020-02-14"
    }
    conn = conn
      |> put_req_header("content-type", "application/json")
      |> post("/api/trips", Poison.encode!(data))
    assert json_response(conn, 200) == %{
      "status" => "ok"
    }
  end
end
