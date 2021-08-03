defmodule Ethos.DataFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ethos.Data` context.
  """

  @doc """
  Generate a tenant.
  """
  def tenant_fixture(attrs \\ %{}) do
    {:ok, tenant} =
      attrs
      |> Enum.into(%{
        icon: "some icon",
        name: "some name"
      })
      |> Ethos.Data.create_tenant()

    tenant
  end

  @doc """
  Generate a document.
  """
  def document_fixture(attrs \\ %{}) do
    {:ok, document} =
      attrs
      |> Enum.into(%{
        icon: "some icon",
        name: "some name",
        type: "some type"
      })
      |> Ethos.Data.create_document()

    document
  end
end
