defmodule BlockScoutWeb.Chain.GasPriceHistoryChartController do
  use BlockScoutWeb, :controller

  alias Explorer.GasPrice

  def show(conn, _params) do
    if ajax?(conn) do
      recent_gas_price_history = GasPrice.fetch_recent_history()
      gas_price_history_data =
        case recent_gas_price_history do
          [today | the_rest] ->
            encode_gas_price_history_data([today | the_rest])

          data ->
            encode_gas_price_history_data(data)
        end
      json(conn, %{gas_price: gas_price_history_data})
    else
      unprocessable_entity(conn)
    end
  end

  defp encode_gas_price_history_data(gas_price_history_data) do
    gas_price_history_data
    |> Enum.map(fn day -> Map.take(day, [:gas_price_l1, :gas_price_l2, :date]) end)
    |> Jason.encode()
    |> case do
      {:ok, data} -> data
      _ -> []
    end
  end
end
