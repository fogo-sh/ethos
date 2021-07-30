module Ethos::Model
  class Tenant
    include JSON::Serializable
    include ::DB::Serializable

    getter uuid : String
    getter name : String
    getter icon : String?
  end

  class Document
    include JSON::Serializable
    include ::DB::Serializable

    getter uuid : String
    getter tenant_uuid : String
    # getter tenant : Tenant?
    getter parent_document_uuid : String?
    # getter parent_document : Document?
    getter name : String
    getter icon : String?
    getter type : String?
  end

  class Piece
    include JSON::Serializable
    include ::DB::Serializable

    getter uuid : String
    getter parent_document_uuid : String
    # getter parent_document : Document?
    getter parent_piece_uuid : String?
    # getter parent_piece : Document?
    getter type : String?
    getter data : String # TODO type what String can be
  end
end
