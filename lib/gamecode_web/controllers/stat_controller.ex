defmodule GamecodeWeb.StatController do
  use GamecodeWeb, :controller

  def weekly(conn, params) do
    response = Gamecode.Database.get_week
      |> GamecodeWeb.WeekStatService.get
      |> Poison.encode!
    conn
      |> put_resp_header("content-type", "application/json")
      |> resp(200, response)
  end

  def monthly(conn, params) do
    response = Gamecode.Database.get_month
      |> GamecodeWeb.MonthStatService.get
      |> Poison.encode!
    conn
      |> put_resp_header("content-type", "application/json")
      |> resp(200, response)
  end
end
