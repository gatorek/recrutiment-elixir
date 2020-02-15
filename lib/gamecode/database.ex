defmodule Gamecode.Database do
  alias Gamecode.Track

  def add_track(_track) do
    :ok
  end

  def get_week do
    [
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
  end

  def get_month do
    [
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
  end

end
