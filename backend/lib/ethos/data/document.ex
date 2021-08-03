defmodule Ethos.Data.Document do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "document" do
    field :icon, :string
    field :name, :string
    field :type, :string
    belongs_to :tenant, Ethos.Data.Tenant

    timestamps()
  end

  @doc false
  def changeset(document, attrs) do
    document
    |> cast(attrs, [:name, :icon, :type, :tenant_id])
    |> validate_required([:name, :tenant_id])
  end
end
