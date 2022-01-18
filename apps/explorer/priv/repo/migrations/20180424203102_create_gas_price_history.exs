defmodule Explorer.Repo.Migrations.CreateGasPriceHistory do
  use Ecto.Migration

  def change do
    create table(:gas_price_history) do
      add(:date, :date)
      add(:gas_price_l1, :decimal)
      add(:gas_price_l2, :decimal)
    end

    create(unique_index(:gas_price_history, :date))
  end
end
