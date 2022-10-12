defmodule RrCodeChallenge.CustomerVendorAllocationQuery do
  import Ecto.Query
  alias Schemas.CustomerVendorAllocation

  defp base, do: CustomerVendorAllocation

  def by_customer_folder_id(query \\ base(), customer_folder_id),
    do: where(query, [cva], cva.customer_folder_id == ^customer_folder_id)

  def preload_vendors(query \\ base()), do: preload(query, [cva], customer_vendor: :vendor)
end
