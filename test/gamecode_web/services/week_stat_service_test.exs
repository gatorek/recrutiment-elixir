defmodule GamecodeWeb.WeekStatServiceTest do
  use ExUnit.Case
  alias Gamecode.Track

  test "Service returns correct week stats" do
    input = [
      %Track {
        start_address: "Portowa",
        destination_address: "Krowia",
        distance: 2.7,
        price: 22.2,
        date: ~D/2020-02-14/
      },
      %Track {
        start_address: "Żeromskiego",
        destination_address: "Dziędzielewicza",
        distance: 22.7,
        price: 11.2,
        date: ~D/2020-02-13/
      }
    ]

    expected = %{
      total_distance: 25.4,
      total_price: 33.4,
    }

    assert GamecodeWeb.WeekStatService.get(input) == expected

  end
end
