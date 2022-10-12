defmodule Schemas.UserAvailableFolder do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:customer_folder_id, :user_id]

  schema "user_available_folders" do
    belongs_to :customer_folder, Schemas.CustomerFolder
    belongs_to :user, Schemas.User

    timestamps()
  end

  @doc false
  def update_changeset(user_available_folder, attrs \\ %{}) do
    user_available_folder
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end

  def changeset(attrs \\ %{}) do
    %__MODULE__{}
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
