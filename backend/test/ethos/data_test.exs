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
end
