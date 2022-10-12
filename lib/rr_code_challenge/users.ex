defmodule RrCodeChallenge.Users do
  alias RrCodeChallenge.Repo
  alias Schemas.User

  def get(id), do: Repo.get(User, id)
end
