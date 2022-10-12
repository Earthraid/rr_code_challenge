defmodule RrCodeChallenge.PortfolioManagement do
  alias RrCodeChallenge.CustomerFolders
  alias RrCodeChallenge.CustomerVendorAllocations
  alias RrCodeChallenge.UserAvailableFolders
  alias RrCodeChallenge.Users
  alias Schemas.User

  def grant_user_access_to_customer_folder(user_id, folder_id) do
    user = Users.get(user_id)
    customer_folder = CustomerFolders.get(folder_id)

    with {:ok, :success} <- ensure_access(user, customer_folder) do
      find_or_maybe_create(user, customer_folder)
    end
  end

  def list_vendors_available_to_user(user_id) do
    with user <- Users.get(user_id) do
      user_vendors = get_vendors(user)
      {:ok, user_vendors}
    end
  end

  defp ensure_access(
         %{customer_id: u_customer_id} = _user,
         %{customer_id: f_customer_id} = _folder
       ) do
    if f_customer_id == u_customer_id do
      {:ok, :success}
    else
      {:error, :unauthorized}
    end
  end

  defp ensure_access(_user, _folder), do: {:error, :not_found}

  defp find_or_maybe_create(user, folder) do
    case UserAvailableFolders.get_by_folder_id_and_user_id(folder.id, user.id) do
      nil ->
        maybe_create(user, folder)

      _ ->
        {:ok, :noop}
    end
  end

  defp maybe_create(user, folder) do
    case UserAvailableFolders.create(%{user_id: user.id, customer_folder_id: folder.id}) do
      {:ok, _record} ->
        {:ok, :added}

      {:error, _changeset} ->
        {:error, :not_added}
    end
  end

  defp get_vendors(%User{} = user) do
    user_available_folders = UserAvailableFolders.get_by_user_id(user.id)

    Enum.reduce(user_available_folders, [], fn uaf, acc ->
      [
        CustomerVendorAllocations.get_vendors(
          CustomerVendorAllocations.get_by_customer_folder_id_preload_vendors(
            uaf.customer_folder.id
          )
        )
        | acc
      ]
    end)
    |> List.flatten()
  end

  defp get_vendors(_), do: []
end
