defmodule RrCodeChallenge.CustomerVendors do
  alias RrCodeChallenge.CustomerVendorQuery
  alias RrCodeChallenge.Repo

  def get_by_user_id_with_vendor(customer_id) do
    CustomerVendorQuery.by_customer_id(customer_id)
    |> CustomerVendorQuery.preload_vendors()
    |> Repo.all()
  end
end
