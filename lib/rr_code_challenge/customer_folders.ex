defmodule RrCodeChallenge.CustomerFolders do
  alias RrCodeChallenge.Repo
  alias Schemas.CustomerFolder

  def get(id), do: Repo.get(CustomerFolder, id)
end
