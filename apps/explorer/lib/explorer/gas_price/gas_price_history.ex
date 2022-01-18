defmodule Explorer.GasPrice.GasPriceHistory do
  @moduledoc """
  Represents market history of configured coin to USD.
  """

  use Explorer.Schema

  schema "gas_price_history" do
    field(:gas_price_l1, :decimal)
    field(:gas_price_l2, :decimal)
    field(:date, :date)
  end

  @type t :: %__MODULE__{
    gas_price_l1: Decimal.t(),
    gas_price_l2: Decimal.t(),
    date: Date.t()
  }
end
