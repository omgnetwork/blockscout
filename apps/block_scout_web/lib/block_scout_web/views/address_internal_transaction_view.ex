defmodule BlockScoutWeb.AddressInternalTransactionView do
  use BlockScoutWeb, :view

  alias BlockScoutWeb.AccessHelpers
# TODO: filters makes no sense it should be IN/OUT
  def format_current_filter(filter) do
    case filter do
      "to" -> gettext("To")
      "from" -> gettext("From")
      _ -> gettext("All")
    end
  end
end
