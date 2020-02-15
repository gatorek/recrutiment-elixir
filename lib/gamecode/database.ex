defmodule Gamecode.Database do
  use GenServer
  use Timex
  alias Gamecode.Track

  def add_track(track) do
    GenServer.cast(__MODULE__, {:put, track} )
  end

  def get_week do
    week_start = Date.utc_today |> Timex.beginning_of_week
    GenServer.call(__MODULE__, :get)
      |> Enum.filter(&(&1.date >= week_start))
  end

  def get_month do
    month_start = Date.utc_today |> Timex.beginning_of_month
    GenServer.call(__MODULE__, :get)
      |> Enum.filter(&(&1.date >= month_start))
  end

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(start) do
    {:ok, start}
  end

  def handle_cast({:put, record}, state) do
    {:noreply, [record | state]}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

end
