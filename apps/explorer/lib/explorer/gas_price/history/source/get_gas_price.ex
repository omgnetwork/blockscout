defmodule Explorer.GasPrice.History.Source.GetGasPrice do
  @moduledoc """
  Adapter for fetching market history from https://cryptocompare.com.

  The history is fetched for the configured coin. You can specify a
  different coin by changing the targeted coin.

      # In config.exs
      config :explorer, coin: "POA"

  """

  alias EthereumJSONRPC
  alias Explorer.{GasPrice}
  alias Explorer.GasPrice.History.Source

  require Logger

  @behaviour Source

  @impl Source
  def fetch_gas_price() do
    json_l1_rpc_named_arguments = Application.get_env(:explorer, :json_l1_rpc_named_arguments)
    json_l2_rpc_named_arguments = Application.get_env(:explorer, :json_rpc_named_arguments)
    case EthereumJSONRPC.fetch_gas_price(json_l1_rpc_named_arguments) do
      {:ok, l1GasPrice} ->
        case EthereumJSONRPC.fetch_gas_price(json_l2_rpc_named_arguments) do
          {:ok, l2GasPrice} ->
            payload = format_data(l1GasPrice, l2GasPrice)
            {:ok, payload}
          {:error, reason} ->
            Logger.debug([
              "Coudn't fetch l2 gas price, reason: #{inspect(reason)}"
            ])
        end

      {:error, reason} ->
        Logger.debug([
          "Coudn't fetch l1 gas price, reason: #{inspect(reason)}"
        ])

    end
  end

  @spec format_data(Decimal.t(), Decimal.t()) :: [Source.record()]
  defp format_data(l1GasPrice, l2GasPrice) do
    gwei_l1_gas_price = GasPrice.gas_price_to_gwei(l1GasPrice)
    gwei_l2_gas_price = GasPrice.gas_price_to_gwei(l2GasPrice)
    [%{
      date: Date.utc_today(),
      gas_price_l1: gwei_l1_gas_price,
      gas_price_l2: gwei_l2_gas_price
    }]
  end
end
