defmodule Holidays.Defenitions.Us do
#  use Holidays

  @moduledoc """
  United States holiday definitions for the Elixir Holiday hex package.
  """

  @months
  [
    {0, [
        %{name: "Good Friday",
          regions: [:us],
          function: {:easter, [:year], -2},
          type: :informal},
        %{name: "Easter Sunday",
          regions: [:us],
          function: {:easter, [:year]},
          type: :informal}
      ]},
    {1, [
        %{name: "New Year's Day",
          regions: [:us],
          mday: 1,
          observed: {:to_weekday_if_weekend, [:date]}},
        %{name: "Martin Luther King, Jr. Day",
          week: 3,
          regions: [:us],
          wday: 1},
        %{name: "Inauguration Day",
          function: {:us_inauguration_day, [:year]},
          regions: [:us_dc]}
      ]},
    {2, [
        %{name: "Presidents' Day",
          week: 3,
          regions: [:us],
          wday: 1}
      ]},
    {3, [
        %{name: "Cesar Chavez Day",
          regions: [:us_ca],
          mday: 31}
      ]},
    {5, [
        %{name: "Memorial Day",
          week: -1,
          regions: [:us],
          wday: 1}
      ]},
    {7, [
        %{name: "Independence Day",
          regions: [:us],
          mday: 4,
          observed: {:to_weekday_if_weekend, [:date]}}
      ]},
    {9, [
        %{name: "Labor Day",
          week: 1,
          regions: [:us],
          wday: 1}
      ]},
    {10, [
        %{name: "Columbus Day",
          week: 2,
          regions: [:us],
          wday: 1}
      ]},
    {11, [
        %{name: "Veterans Day",
          regions: [:us],
          mday: 11,
          observed: {:to_weekday_if_weekend, [:date]}},
        %{name: "Thanksgiving",
          week: 4,
          regions: [:us],
          wday: 4},
        %{name: "Day after Thanksgiving",
          week: 4,
          regions: [:us],
          wday: 5}
      ]},
    {12, [
        %{name: "Christmas Day",
          regions: [:us],
          mday: 25,
          observed: {:to_weekday_if_weekend, [:date]}}
      ]}
  ]

  @doc """
  January 20, every fourth year, following Presidential election.

  ## Examples

      iex> Holidays.Defenitions.Us.us_inauguration_day(2016)
      :none

      iex> Holidays.Defenitions.Us.us_inauguration_day(2017)
      {2017, 1, 20}

      iex> Holidays.Defenitions.Us.us_inauguration_day(2018)
      :none
  """
  def us_inauguration_day(year) when rem(year, 4) == 1, do: {:ok, {year, 1, 20}}
  def us_inauguration_day(_year), do: :none

end