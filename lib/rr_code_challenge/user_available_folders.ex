defmodule RrCodeChallenge.UserAvailableFolders do
  alias Schemas.UserAvailableFolder
  alias RrCodeChallenge.Repo
  alias Queries.UserAvailableFolderQuery

  def create(attrs) do
    UserAvailableFolder.changeset(attrs)
    |> Repo.insert()
  end

  def get(id), do: Repo.get(UserAvailableFolder, id)

  def get_by_folder_id_and_user_id(folder_id, user_id) do
    UserAvailableFolderQuery.by_folder_id(folder_id)
    |> UserAvailableFolderQuery.by_user_id(user_id)
    |> Repo.one()
  end

  def get_by_user_id(user_id) do
    UserAvailableFolderQuery.by_user_id(user_id)
    |> UserAvailableFolderQuery.preload_customer_folders()
    |> Repo.all()
  end
end
