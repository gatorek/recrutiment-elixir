defmodule GamecodeWeb.GoogleDistanceApiClient do

  @spec get(String.t(), String.t()) :: number
  def get(origin, destination) do
    base_url = 'https://maps.googleapis.com/maps/api/distancematrix/json?units=metric'
    origin_url = "&origins=" <> URI.encode(origin)
      |> String.to_charlist
    destination_url = "&destinations=" <> URI.encode(destination)
      |> String.to_charlist
    api_key_url = "&key=" <> Application.get_env(:gamecode, :google_api_key)
      |> String.to_charlist
    url = base_url ++ origin_url ++ destination_url ++ api_key_url

    {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}}  = :httpc.request(:get, {url, []}, [], [])

    body
      |> List.to_string
      |> Poison.decode!
      |> Map.get("rows")
      |> List.first
      |> Map.get("elements")
      |> List.first
      |> Map.get("distance")
      |> Map.get("value")
  end
end
