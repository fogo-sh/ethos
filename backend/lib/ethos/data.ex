defmodule Ethos.Data do
  import Ecto.Query, warn: false

  alias Ethos.Repo
  alias Ethos.Data.{Tenant, Document}

  def list_tenant do
    Repo.all(Tenant)
  end

  def get_tenant!(id), do: Repo.get!(Tenant, id)

  def create_tenant(attrs \\ %{}) do
    %Tenant{}
    |> Tenant.changeset(attrs)
    |> Repo.insert()
  end

  def update_tenant(%Tenant{} = tenant, attrs) do
    tenant
    |> Tenant.changeset(attrs)
    |> Repo.update()
  end

  def delete_tenant(%Tenant{} = tenant) do
    Repo.delete(tenant)
  end

  def change_tenant(%Tenant{} = tenant, attrs \\ %{}) do
    Tenant.changeset(tenant, attrs)
  end

  def list_document do
    Repo.all(Document)
  end

  def list_document_by_tenant(tenant_id) do
    Repo.all(
      from d in Document,
        where: d.tenant_id == ^tenant_id
    )
  end

  def get_document!(id), do: Repo.get!(Document, id)

  def create_document(attrs \\ %{}) do
    %Document{}
    |> Document.changeset(attrs)
    |> Repo.insert()
  end

  def update_document(%Document{} = document, attrs) do
    document
    |> Document.changeset(attrs)
    |> Repo.update()
  end

  def delete_document(%Document{} = document) do
    Repo.delete(document)
  end

  def change_document(%Document{} = document, attrs \\ %{}) do
    Document.changeset(document, attrs)
  end
end
