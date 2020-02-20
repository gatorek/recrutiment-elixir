defmodule GamecodeWeb.DistanceServiceTest do
  use ExUnit.Case

  test "Service returns numeric distance" do
    assert is_number(GamecodeWeb.DistanceService.get("Warszawa", "Kraków"))
  end

  test "Service returns correct distance" do
    assert_in_delta(GamecodeWeb.DistanceService.get("Warszawa", "Kraków"), 290000, 30000)
    assert_in_delta(GamecodeWeb.DistanceService.get("Świeradowska 47, Warszawa", "Plac Konesera 8, Warszawa"), 12000, 3000)

  end
end
