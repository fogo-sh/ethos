defmodule EthosWeb.TenantView do
  import Ecto.UUID, only: [cast!: 1]

  use EthosWeb, :view
  alias EthosWeb.TenantView

  def render("index.json", %{tenant: tenant}) do
    render_many(tenant, TenantView, "tenant.json")
  end

  def render("show.json", %{tenant: tenant}) do
    render_one(tenant, TenantView, "tenant.json")
  end

  def render("tenant.json", %{tenant: tenant}) do
    %{
      id: cast!(tenant.id),
      name: tenant.name,
      icon: tenant.icon
    }
  end
end
