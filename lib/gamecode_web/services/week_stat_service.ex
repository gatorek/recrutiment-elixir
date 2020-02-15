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
end
