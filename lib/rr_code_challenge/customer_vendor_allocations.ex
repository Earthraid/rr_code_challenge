defmodule RrCodeChallenge.CustomerVendorAllocations do
  alias RrCodeChallenge.CustomerVendorAllocationQuery
  alias RrCodeChallenge.Repo

  def get_by_customer_folder_id_preload_vendors(customer_folder_id) do
    CustomerVendorAllocationQuery.by_customer_folder_id(customer_folder_id)
    |> CustomerVendorAllocationQuery.preload_vendors()
    |> Repo.all()
  end

  def get_vendors(allocations) do
    Enum.map(allocations, fn a -> a.customer_vendor.vendor end)
  end
end
