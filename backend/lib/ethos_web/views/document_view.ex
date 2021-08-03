defmodule EthosWeb.DocumentView do
  import Ecto.UUID, only: [cast!: 1]

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
      id: cast!(document.id),
      name: document.name,
      icon: document.icon,
      type: document.type,
      tenant_id: cast!(document.tenant_id)
    }
  end
end
