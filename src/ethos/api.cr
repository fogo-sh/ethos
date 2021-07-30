require "athena"

class Ethos::Controller < ART::Controller
  @[ARTA::Get("/")]
  def index : String
    "ethos"
  end

  @[ARTA::Get("/tenant")]
  def list_tenants : Array(Ethos::Model::Tenant)
    DB.query_all("SELECT * FROM tenant", as: Model::Tenant)
  end

  @[ARTA::Get("/document")]
  def list_documents : Array(Ethos::Model::Document)
    DB.query_all("SELECT * FROM document", as: Model::Document)
  end

  @[ARTA::Get("/piece")]
  def list_pieces : Array(Ethos::Model::Piece)
    DB.query_all("SELECT * FROM piece", as: Model::Piece)
  end
end
