defmodule GamecodeWeb.StatController do
  use GamecodeWeb, :controller

  def weekly(conn, _params) do
    response = Gamecode.Database.get_week
      |> GamecodeWeb.WeekStatService.get
      |> Poison.encode!
    conn
      |> put_resp_header("content-type", "application/json")
      |> resp(200, response)
  end

  def monthly(conn, _params) do
    response = Gamecode.Database.get_month
      |> GamecodeWeb.MonthStatService.get
      |> Poison.encode!
    conn
      |> put_resp_header("content-type", "application/json")
      |> resp(200, response)
  end
end
