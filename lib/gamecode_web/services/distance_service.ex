defmodule GamecodeWeb.DistanceService do

  @spec get(String.t(), String.t()) :: number
  def get(origin, destination) do
    GamecodeWeb.GoogleDistanceApiClient.get(origin, destination)
  end
end
