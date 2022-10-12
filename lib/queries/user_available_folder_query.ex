defmodule Queries.UserAvailableFolderQuery do
  import Ecto.Query
  alias Schemas.UserAvailableFolder

  defp base, do: UserAvailableFolder

  def by_folder_id(query \\ base(), folder_id),
    do: where(query, [uf], uf.customer_folder_id == ^folder_id)

  def by_user_id(query \\ base(), user_id), do: where(query, [uf], uf.user_id == ^user_id)

  def preload_customer_folders(query \\ base()), do: preload(query, [uf], [:customer_folder])
end
