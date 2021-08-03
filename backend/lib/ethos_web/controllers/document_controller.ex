defmodule EthosWeb.DocumentController do
  use EthosWeb, :controller

  alias Ethos.Data
  alias Ethos.Data.Document

  action_fallback EthosWeb.FallbackController

  def index(conn, _params) do
    document = Data.list_document()
    render(conn, "index.json", document: document)
  end

  def create(conn, %{"document" => document_params}) do
    with {:ok, %Document{} = document} <- Data.create_document(document_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.document_path(conn, :show, document))
      |> render("show.json", document: document)
    end
  end

  def show(conn, %{"id" => id}) do
    document = Data.get_document!(Ecto.UUID.dump!(id))
    render(conn, "show.json", document: document)
  end

  def update(conn, %{"id" => id, "document" => document_params}) do
    document = Data.get_document!(Ecto.UUID.dump!(id))

    with {:ok, %Document{} = document} <- Data.update_document(document, document_params) do
      render(conn, "show.json", document: document)
    end
  end

  def delete(conn, %{"id" => id}) do
    document = Data.get_document!(Ecto.UUID.dump!(id))

    with {:ok, %Document{}} <- Data.delete_document(document) do
      send_resp(conn, :no_content, "")
    end
  end
end
