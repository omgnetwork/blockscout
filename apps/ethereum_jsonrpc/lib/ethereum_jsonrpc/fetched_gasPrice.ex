defmodule EthereumJSONRPC.FetchedGasPrice do
  @moduledoc """
  A single gas price fetched from `eth_gasPrice`.
  """

  import EthereumJSONRPC, only: [quantity_to_integer: 1]

  @type params :: %{value: non_neg_integer()}
  @type error :: %{code: integer(), message: String.t()}

  @doc """
  Converts `response` to gas price param or error.
  """

  @spec from_response(%{id: id, result: String.t()}) ::
          {:ok, params()}
        when id: non_neg_integer()
  def from_response(%{id: id, result: fetched_gas_price_quantity}) do
    {:ok,
     %{
       value: quantity_to_integer(fetched_gas_price_quantity)
     }}
  end

  @spec from_response(%{id: id, error: %{code: code, message: message}}) ::
          {:error, %{code: code, message: message}}
        when id: non_neg_integer(),
             code: integer(),
             message: String.t()
  def from_response(%{id: id, error: %{code: code, message: message} = error}) do
    {:error}
  end

  @spec request(%{id: id}) :: %{
          jsonrpc: String.t(),
          id: id,
          method: String.t(),
          params: []
        }
        when id: EthereumJSONRPC.request_id()
  def request(%{id: id}) do
    EthereumJSONRPC.request(%{id: id, method: "eth_gasPrice", params: []})
  end
end
