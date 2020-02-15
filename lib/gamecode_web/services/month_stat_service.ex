defmodule GamecodeWeb.MonthStatService do

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
          avg_ride: &1.total_distance / &1.count,
          avg_price: &1.total_price / &1.count
        }
      ))
  end
end
