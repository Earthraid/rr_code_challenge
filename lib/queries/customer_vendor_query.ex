defmodule RrCodeChallenge.CustomerVendorQuery do
  import Ecto.Query
  alias Schemas.CustomerVendor

  defp base(), do: CustomerVendor

  def by_customer_id(query \\ base(), customer_id),
    do: where(query, [cv], cv.customer_id == ^customer_id)

  def preload_vendors(query \\ base()), do: preload(query, [cv], [:vendor])
end
