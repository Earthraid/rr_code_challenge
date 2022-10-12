defmodule RrCodeChallenge.Customers do
  alias RrCodeChallenge.CustomerQuery
  alias RrCodeChallenge.Repo

  def get_with_vendors(id) do
    CustomerQuery.by_id(id)
    |> CustomerQuery.preload_vendors()
    |> Repo.one()
  end
end
