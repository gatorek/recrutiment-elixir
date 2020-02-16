defmodule GamecodeWeb.DistanceService do

  @spec get(String.t(), String.t()) :: number
  def get(origin, destination) do
    GamecodeWeb.GoogleDistanceApiClient.get(origin, destination) / 1000 |> Float.round(1)
  end
end
