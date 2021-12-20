defmodule BlockScoutWeb.GasPricesChannel do
  @moduledoc """
  Establishes pub/sub channel for page live updates of the gas prices.
  """
  use BlockScoutWeb, :channel

  intercept(["new_prices"])

  def join("gas_prices:new_prices", _params, socket) do
    {:ok, %{}, socket}
  end

  def handle_out("new_prices", %{
      gas_price_l1: gas_price_l1, 
      gas_price_l2: gas_price_l2, 
      gas_price_history_data: gas_price_history_data
    }, socket) do
    push(socket, "new_prices", %{
      gas_price_l1: gas_price_l1,
      gas_price_l2: gas_price_l2,
      gas_price_history_data: gas_price_history_data
    })

    {:noreply, socket}
  end
end
