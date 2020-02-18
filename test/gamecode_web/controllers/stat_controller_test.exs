defmodule GamecodeWeb.StatControllerTest do
  use GamecodeWeb.ConnCase

  setup_all _context do
    data = [
      %{
        start_address: "Świeradowska 47, Warszawa",
        destination_address: "Plac Konesera 8, Warszawa", # distance 12.2
        price: 12.2,
        date: ~D/2020-02-18/
      },
      %{
        start_address: "Boryszewska 2, Wiązowna",
        destination_address: "Frezji 17, Boryszew", # distance: 2.7
        price: 41.2,
        date: ~D/2020-02-17/
      },
      %{
        start_address: "Norwida 24, Otwock",
        destination_address: "Mokra 2, Celestynów", # distance: 10.2
        price: 7,
        date: ~D/2020-02-02/
      },
      %{
        start_address: "Norwida 24, Otwock",
        destination_address: "Mokra 2, Celestynów", # distance: 10.2
        price: 37.1,
        date: ~D/2020-02-02/
      },
      %{
        start_address: "Norwida 24, Otwock",
        destination_address: "Mokra 2, Celestynów", # distance: 10.2
        price: 51.2,
        date: ~D/2020-02-01/
      }
    ]
    data |> Enum.each( fn (d) ->
        Phoenix.ConnTest.build_conn()
          |> Plug.Conn.put_req_header("content-type", "application/json")
          |> Plug.Conn.put_req_header("accepts", "application/json")
          |> post("/api/trips", Poison.encode!(d))
      end
    )
    :ok
  end

  test "GET /api/stats/weekly", %{conn: conn} do
    expected = %{
      "total_distance" => 15.3,
      "total_price" => 53.4,
    }

    conn = conn
      |> get("/api/stats/weekly")
    response = json_response(conn, 200)
    assert response["total_price"] == 53.4
    assert_in_delta response["total_distance"], 15.3, 2
  end

  test "GET /api/stats/monthly", %{conn: conn} do
    expected = [
      %{
        "day" => "2020-02-01",
        "total_distance" => 10.2,
        "avg_ride" => 10.2,
        "avg_price" => 51.2
      },
      %{
        "day" => "2020-02-02",
        "total_distance" => 20.4,
        "avg_ride" => 10.2,
        "avg_price" => 22.05
      },
      %{
        "day" => "2020-02-17",
        "total_distance" => 2.7,
        "avg_ride" => 2.7,
        "avg_price" => 41.2
      },
      %{
        "day" => "2020-02-18",
        "total_distance" => 12.2,
        "avg_ride" => 12.2,
        "avg_price" => 12.2
      },
    ]

    conn = conn
      |> get("/api/stats/monthly")
    assert Enum.sort(json_response(conn, 200)) == Enum.sort(expected)
  end
end
