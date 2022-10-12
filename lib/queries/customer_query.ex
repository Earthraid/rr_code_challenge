defmodule RrCodeChallenge.CustomerQuery do
  import Ecto.Query
  alias Schemas.Customer

  defp base, do: Customer

  def by_id(query \\ base(), customer_id), do: where(query, [c], c.id == ^customer_id)

  def preload_vendors(query \\ base()), do: preload(query, [c], customer_vendors: :vendor)
end
