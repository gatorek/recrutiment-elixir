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
end
