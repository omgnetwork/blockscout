defmodule Explorer.GasPrice.History.Source do
  @moduledoc """
  Interface for a source that allows for fetching of market history.
  """

  @typedoc """
  Record of market values for a specific date.
  """
  @type record :: %{
          date: Date.t(),
          gas_price_l1: Decimal.t(),
          gas_price_l2: Decimal.t()
        }

  @doc """
  Fetch history for a specified amount of days in the past.
  """
  @callback fetch_gas_price() :: {:ok, [record()]} | :error
end
