defmodule GamecodeWeb.MonthStatServiceTest do
  use ExUnit.Case
  alias Gamecode.Track

  test "Service returns correct week stats" do
    input = [
      %Track {
        start_address: "Portowa",
        destination_address: "Krowia",
        distance: 2700,
        price: 1220,
        date: ~D/2020-02-14/
      },
      %Track {
        start_address: "Żeromskiego",
        destination_address: "Dziędzielewicza",
        distance: 22700,
        price: 4120,
        date: ~D/2020-02-13/
      },
      %Track {
        start_address: "Abecadła",
        destination_address: "Bednarskiego",
        distance: 1000,
        price: 700,
        date: ~D/2020-02-02/
      },
      %Track {
        start_address: "Czeczotki",
        destination_address: "Dalii",
        distance: 20000,
        price: 3710,
        date: ~D/2020-02-02/
      },
      %Track {
        start_address: "Hoplitów",
        destination_address: "Legionów",
        distance: 44400,
        price: 5120,
        date: ~D/2020-02-01/
      }
    ]


    expected = [
      %{
        day: ~D/2020-02-01/,
        total_distance: 44400,
        avg_ride: 44400,
        avg_price: 5120
      },
      %{
        day: ~D/2020-02-02/,
        total_distance: 21000,
        avg_ride: 10500,
        avg_price: 2205
      },
      %{
        day: ~D/2020-02-13/,
        total_distance: 22700,
        avg_ride: 22700,
        avg_price: 4120
      },
      %{
        day: ~D/2020-02-14/,
        total_distance: 2700,
        avg_ride: 2700,
        avg_price: 1220
      },
    ]
    assert Enum.sort(GamecodeWeb.MonthStatService.get(input)) == Enum.sort(expected)

  end

  test "month service rounds correctly" do
    data = [
      %{
        day: ~D/2020-02-01/,
        total_distance: 44400,
        avg_ride: 44400,
        avg_price: 5120
      },
      %{
        day: ~D/2020-02-02/,
        total_distance: 21000,
        avg_ride: 10500,
        avg_price: 2205
      },
    ]

    rounded = [
      %{
        day: ~D/2020-02-01/,
        total_distance: 44.4,
        avg_ride: 44.4,
        avg_price: 51.20
      },
      %{
        day: ~D/2020-02-02/,
        total_distance: 21,
        avg_ride: 10.5,
        avg_price: 22.05
      },
    ]

    assert GamecodeWeb.MonthStatService.round(data) == rounded
  end
end
