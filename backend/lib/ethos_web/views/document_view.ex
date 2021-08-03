defmodule EthosWeb.DocumentView do
  use EthosWeb, :view
  alias EthosWeb.DocumentView

  def render("index.json", %{document: document}) do
    render_many(document, DocumentView, "document.json")
  end

  def render("show.json", %{document: document}) do
    render_one(document, DocumentView, "document.json")
  end

  def render("document.json", %{document: document}) do
    %{
      id: Ecto.UUID.cast!(document.id),
      name: document.name,
      icon: document.icon,
      type: document.type,
      tenant_id: Ecto.UUID.cast!(document.tenant_id)
    }
  end
end
