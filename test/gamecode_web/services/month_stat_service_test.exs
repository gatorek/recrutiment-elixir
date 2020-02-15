defmodule GamecodeWeb.MonthStatServiceTest do
  use ExUnit.Case
  alias Gamecode.Track

  test "Service returns correct week stats" do
    input = [
      %Track {
        start_address: "Portowa",
        destination_address: "Krowia",
        distance: 2.7,
        price: 12.2,
        date: ~D/2020-02-14/
      },
      %Track {
        start_address: "Żeromskiego",
        destination_address: "Dziędzielewicza",
        distance: 22.7,
        price: 41.2,
        date: ~D/2020-02-13/
      },
      %Track {
        start_address: "Abecadła",
        destination_address: "Bednarskiego",
        distance: 1,
        price: 7,
        date: ~D/2020-02-02/
      },
      %Track {
        start_address: "Czeczotki",
        destination_address: "Dalii",
        distance: 20,
        price: 37.1,
        date: ~D/2020-02-02/
      },
      %Track {
        start_address: "Hoplitów",
        destination_address: "Legionów",
        distance: 44.4,
        price: 51.2,
        date: ~D/2020-02-01/
      }
    ]


    expected = [
      %{
        day: ~D/2020-02-01/,
        total_distance: 44.4,
        avg_ride: 44.4,
        avg_price: 51.2
      },
      %{
        day: ~D/2020-02-02/,
        total_distance: 21.0,
        avg_ride: 10.5,
        avg_price: 22.05
      },
      %{
        day: ~D/2020-02-13/,
        total_distance: 22.7,
        avg_ride: 22.7,
        avg_price: 41.2
      },
      %{
        day: ~D/2020-02-14/,
        total_distance: 2.7,
        avg_ride: 2.7,
        avg_price: 12.2
      },
    ]

    assert Enum.sort(GamecodeWeb.MonthStatService.get(input)) == Enum.sort(expected)

  end
end
