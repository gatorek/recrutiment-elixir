defmodule GamecodeWeb.WeekStatService do

  def get(data) do
    data |> Enum.reduce(
        %{total_distance: 0, total_price: 0},
        &(%{
          total_distance: &2.total_distance + &1.distance,
          total_price: &2.total_price + &1.price,
        })
      )
  end

  def round data do
    %{
      total_distance: data.total_distance / 1000 |> Float.round(1),
      total_price: data.total_price / 100 |> Float.round(2)
    }
  end

  def format data do
    %{
      total_distance: (data.total_distance |> to_string) <> "km",
      total_price: (data.total_price |> to_string) <> "PLN"
    }
  end

end
