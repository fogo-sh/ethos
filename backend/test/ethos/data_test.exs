defmodule Ethos.DataTest do
  use Ethos.DataCase

  alias Ethos.Data

  describe "tenant" do
    alias Ethos.Data.Tenant

    import Ethos.DataFixtures

    @invalid_attrs %{icon: nil, name: nil}

    test "list_tenant/0 returns all tenant" do
      tenant = tenant_fixture()
      assert Data.list_tenant() == [tenant]
    end

    test "get_tenant!/1 returns the tenant with given id" do
      tenant = tenant_fixture()
      assert Data.get_tenant!(tenant.id) == tenant
    end

    test "create_tenant/1 with valid data creates a tenant" do
      valid_attrs = %{icon: "some icon", name: "some name"}

      assert {:ok, %Tenant{} = tenant} = Data.create_tenant(valid_attrs)
      assert tenant.icon == "some icon"
      assert tenant.name == "some name"
    end

    test "create_tenant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_tenant(@invalid_attrs)
    end

    test "update_tenant/2 with valid data updates the tenant" do
      tenant = tenant_fixture()
      update_attrs = %{icon: "some updated icon", name: "some updated name"}

      assert {:ok, %Tenant{} = tenant} = Data.update_tenant(tenant, update_attrs)
      assert tenant.icon == "some updated icon"
      assert tenant.name == "some updated name"
    end

    test "update_tenant/2 with invalid data returns error changeset" do
      tenant = tenant_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_tenant(tenant, @invalid_attrs)
      assert tenant == Data.get_tenant!(tenant.id)
    end

    test "delete_tenant/1 deletes the tenant" do
      tenant = tenant_fixture()
      assert {:ok, %Tenant{}} = Data.delete_tenant(tenant)
      assert_raise Ecto.NoResultsError, fn -> Data.get_tenant!(tenant.id) end
    end

    test "change_tenant/1 returns a tenant changeset" do
      tenant = tenant_fixture()
      assert %Ecto.Changeset{} = Data.change_tenant(tenant)
    end
  end

  describe "document" do
    alias Ethos.Data.Document

    import Ethos.DataFixtures

    @invalid_attrs %{icon: nil, name: nil, type: nil}

    test "list_document/0 returns all document" do
      document = document_fixture()
      assert Data.list_document() == [document]
    end

    test "get_document!/1 returns the document with given id" do
      document = document_fixture()
      assert Data.get_document!(document.id) == document
    end

    test "create_document/1 with valid data creates a document" do
      valid_attrs = %{icon: "some icon", name: "some name", type: "some type"}

      assert {:ok, %Document{} = document} = Data.create_document(valid_attrs)
      assert document.icon == "some icon"
      assert document.name == "some name"
      assert document.type == "some type"
    end

    test "create_document/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_document(@invalid_attrs)
    end

    test "update_document/2 with valid data updates the document" do
      document = document_fixture()
      update_attrs = %{icon: "some updated icon", name: "some updated name", type: "some updated type"}

      assert {:ok, %Document{} = document} = Data.update_document(document, update_attrs)
      assert document.icon == "some updated icon"
      assert document.name == "some updated name"
      assert document.type == "some updated type"
    end

    test "update_document/2 with invalid data returns error changeset" do
      document = document_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_document(document, @invalid_attrs)
      assert document == Data.get_document!(document.id)
    end

    test "delete_document/1 deletes the document" do
      document = document_fixture()
      assert {:ok, %Document{}} = Data.delete_document(document)
      assert_raise Ecto.NoResultsError, fn -> Data.get_document!(document.id) end
    end

    test "change_document/1 returns a document changeset" do
      document = document_fixture()
      assert %Ecto.Changeset{} = Data.change_document(document)
    end
  end
end
