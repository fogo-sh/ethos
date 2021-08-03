defmodule EthosWeb.TenantController do
  use EthosWeb, :controller

  alias Ethos.Data
  alias Ethos.Data.Tenant

  action_fallback EthosWeb.FallbackController

  def index(conn, _params) do
    tenant = Data.list_tenant()
    render(conn, "index.json", tenant: tenant)
  end

  def show(conn, %{"id" => id}) do
    tenant = Data.get_tenant!(Ecto.UUID.dump!(id))
    render(conn, "show.json", tenant: tenant)
  end

  # TODO
  def create(conn, %{"tenant" => tenant_params}) do
    with {:ok, %Tenant{} = tenant} <- Data.create_tenant(tenant_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tenant_path(conn, :show, tenant))
      |> render("show.json", tenant: tenant)
    end
  end

  # TODO
  def update(conn, %{"id" => id, "tenant" => tenant_params}) do
    tenant = Data.get_tenant!(Ecto.UUID.dump!(id))

    with {:ok, %Tenant{} = tenant} <- Data.update_tenant(tenant, tenant_params) do
      render(conn, "show.json", tenant: tenant)
    end
  end

  # TODO
  def delete(conn, %{"id" => id}) do
    tenant = Data.get_tenant!(Ecto.UUID.dump!(id))

    with {:ok, %Tenant{}} <- Data.delete_tenant(tenant) do
      send_resp(conn, :no_content, "")
    end
  end
end
