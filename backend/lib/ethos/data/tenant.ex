defmodule Ethos.Data.Tenant do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tenant" do
    field :icon, :string
    field :name, :string
    has_many :document, Ethos.Data.Document

    timestamps()
  end

  @doc false
  def changeset(tenant, attrs) do
    tenant
    |> cast(attrs, [:name, :icon])
    |> validate_required([:name])
  end
end
