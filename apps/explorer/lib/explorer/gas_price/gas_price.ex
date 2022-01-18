defmodule Explorer.GasPrice do
  @moduledoc """
  Context for data related to gas price
  """
  require Ecto.Query

  import Ecto.Query
  alias Explorer.GasPrice.{GasPriceHistory, GasPriceHistoryCache}
  alias Explorer.Repo
  alias Explorer.Chain.Wei

  @doc """
  Retrieves the history for the recent specified amount of days.

  Today's date is include as part of the day count
  """
  @spec fetch_recent_history() :: [GasPriceHistory.t()]
  def fetch_recent_history do
    GasPriceHistoryCache.fetch()
  end

  @doc false
  def bulk_insert_history(records) do
    Repo.insert_all(GasPriceHistory, records, on_conflict: :nothing, conflict_target: [:date])
  end

  def bulk_update_history(GasPriceHistory) do
    date = Date.utc_today()
    Repo.update_all(from(record in GasPriceHistory, where: record.date == ^date), set: [])
  end

  def gas_price_to_gwei(gas_price) do
    gas_price
    |> Decimal.new()
    |> Wei.from(:wei)
    |> Wei.to(:gwei)
  end

end
