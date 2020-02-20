defmodule GamecodeWeb.MonthStatService do
  use Timex

  def get(data) do
    data
      |> Enum.group_by(&(&1.date))
      |> Enum.map(
        fn({date, val}) ->
          Enum.reduce(
            val,
            %{
              day: date,
              total_distance: 0,
              total_price: 0,
              count: 0,
            },
            fn(v, acc) ->
              %{acc |
                total_distance: acc.total_distance + v.distance,
                total_price: acc.total_price + v.price,
                count: acc.count + 1
              }
            end
          )
        end
      )
      |> Enum.map(&(
        %{
          day: &1.day,
          total_distance: &1.total_distance,
          avg_ride: div(&1.total_distance, &1.count),
          avg_price: div(&1.total_price, &1.count)
        }
      ))
  end

  def round data do
    data |> Enum.map(&(
        %{&1 |
          total_distance: Float.round(&1.total_distance / 1000, 1),
          avg_ride: Float.round(&1.avg_ride / 1000, 1),
          avg_price: Float.round(&1.avg_price / 100, 2),
        }
      ))
  end

  def format data do
    data |> Enum.map(&(
        %{
          day: Timex.format!(&1.day, "%b %e", :strftime),
          total_distance: to_string(&1.total_distance) <> "km",
          avg_ride: to_string(&1.avg_ride) <> "km",
          avg_price: to_string(&1.avg_price) <> "PLN",
        }
      ))
  end
end
