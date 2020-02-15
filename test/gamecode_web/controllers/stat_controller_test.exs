defmodule GamecodeWeb.StatControllerTest do
  use GamecodeWeb.ConnCase

  setup_all context do
    data = [
      %{
        start_address: "Portowa",
        destination_address: "Krowia",
        price: 12.2,
        date: ~D/2020-02-14/
      },
      %{
        start_address: "Żeromskiego",
        destination_address: "Dziędzielewicza",
        price: 41.2,
        date: ~D/2020-02-13/
      },
      %{
        start_address: "Abecadła",
        destination_address: "Bednarskiego",
        price: 7,
        date: ~D/2020-02-02/
      },
      %{
        start_address: "Czeczotki",
        destination_address: "Dalii",
        price: 37.1,
        date: ~D/2020-02-02/
      },
      %{
        start_address: "Hoplitów",
        destination_address: "Legionów",
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
      "total_distance" => 84,
      "total_price" => 53.4,
    }

    conn = conn
      |> get("/api/stats/weekly")
    assert json_response(conn, 200) == expected
  end

  test "GET /api/stats/monthly", %{conn: conn} do
    expected = [
      %{
        "day" => "2020-02-01",
        "total_distance" => 42.0,
        "avg_ride" => 42.0,
        "avg_price" => 51.2
      },
      %{
        "day" => "2020-02-02",
        "total_distance" => 2*42.0,
        "avg_ride" => 42.0,
        "avg_price" => 22.05
      },
      %{
        "day" => "2020-02-13",
        "total_distance" => 42.0,
        "avg_ride" => 42.0,
        "avg_price" => 41.2
      },
      %{
        "day" => "2020-02-14",
        "total_distance" => 42.0,
        "avg_ride" => 42.0,
        "avg_price" => 12.2
      },
    ]

    conn = conn
      |> get("/api/stats/monthly")
    assert Enum.sort(json_response(conn, 200)) == Enum.sort(expected)
  end
end
