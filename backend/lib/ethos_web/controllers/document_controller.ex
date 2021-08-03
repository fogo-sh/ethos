defmodule EthosWeb.DocumentController do
  use EthosWeb, :controller

  alias Ethos.Data
  alias Ethos.Data.Document

  action_fallback EthosWeb.FallbackController

  def index(conn, %{"tenant_id" => tenant_id}) do
    document = Data.list_document_by_tenant(Ecto.UUID.dump!(tenant_id))
    render(conn, "index.json", document: document)
  end

  def show(conn, %{"id" => id}) do
    document = Data.get_document!(Ecto.UUID.dump!(id))
    render(conn, "show.json", document: document)
  end

  # TODO
  def create(conn, %{"document" => document_params}) do
    with {:ok, %Document{} = document} <- Data.create_document(document_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.document_path(conn, :show, document))
      |> render("show.json", document: document)
    end
  end

  # TODO
  def update(conn, %{"id" => id, "document" => document_params}) do
    document = Data.get_document!(Ecto.UUID.dump!(id))

    with {:ok, %Document{} = document} <- Data.update_document(document, document_params) do
      render(conn, "show.json", document: document)
    end
  end

  # TODO
  def delete(conn, %{"id" => id}) do
    document = Data.get_document!(Ecto.UUID.dump!(id))

    with {:ok, %Document{}} <- Data.delete_document(document) do
      send_resp(conn, :no_content, "")
    end
  end
end
