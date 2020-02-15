defmodule GamecodeWeb.StatControllerTest do
  use GamecodeWeb.ConnCase

  test "GET /api/stats/weekly", %{conn: conn} do
    expected = %{
      "total_distance" => 25.4,
      "total_price" => 33.4,
    }

    conn = conn
      |> get("/api/stats/weekly")
    assert json_response(conn, 200) == expected
  end

  test "GET /api/stats/monthly", %{conn: conn} do
    expected = [
      %{
        "day" => "2020-02-01",
        "total_distance" => 44.4,
        "avg_ride" => 44.4,
        "avg_price" => 51.2
      },
      %{
        "day" => "2020-02-02",
        "total_distance" => 21.0,
        "avg_ride" => 10.5,
        "avg_price" => 22.05
      },
      %{
        "day" => "2020-02-13",
        "total_distance" => 22.7,
        "avg_ride" => 22.7,
        "avg_price" => 41.2
      },
      %{
        "day" => "2020-02-14",
        "total_distance" => 2.7,
        "avg_ride" => 2.7,
        "avg_price" => 12.2
      },
    ]

    conn = conn
      |> get("/api/stats/monthly")
    assert Enum.sort(json_response(conn, 200)) == Enum.sort(expected)
  end
end
