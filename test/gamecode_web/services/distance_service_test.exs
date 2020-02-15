defmodule GamecodeWeb.DistanceServiceTest do
  use ExUnit.Case

  test "Service returns numeric distance" do
    assert is_number(GamecodeWeb.DistanceService.get('', ''))
  end
end
