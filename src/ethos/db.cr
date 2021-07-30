require "sqlite3"
require "db"

class Ethos::DB
  @@db : ::DB::Database = ::DB.open("sqlite3://./ethos.db")

"
Table document {
  uuid uuid [pk]
  name text
  icon text
  type text
  parent_document_uuid uuid [ref: > document.uuid]
  tenant_uuid uuid [ref: > tenant.uuid]
}

Table piece {
  uuid uuid [pk]
  parent_document_uuid uuid [ref: > document.uuid]
  parent_piece_uuid uuid [ref: > piece.uuid]
  type text
  properties json
}
"

  DB_INIT_SQL = <<-SQL
    CREATE TABLE IF NOT EXISTS tenant (
      uuid TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      icon TEXT
    );

    CREATE TABLE IF NOT EXISTS document (
      uuid TEXT PRIMARY KEY,
      tenant_uuid TEXT NOT NULL REFERENCES tenant(uuid),
      parent_document_uuid TEXT REFERENCES document(uuid),
      name TEXT NOT NULL,
      icon TEXT,
      type TEXT
    );

    CREATE TABLE IF NOT EXISTS piece (
      uuid TEXT PRIMARY KEY,
      parent_document_uuid TEXT NOT NULL REFERENCES document(uuid),
      parent_piece_uuid TEXT REFERENCES piece(uuid),
      type TEXT,
      data TEXT
    )
    SQL

  def self.setup
    populate_tables
  end

  def self.populate_tables
    DB_INIT_SQL.split(";").each do |table_init_sql|
      @@db.exec(table_init_sql)
    end
  end

  def self.parse_time(time)
    Time.parse(time, SQLite3::DATE_FORMAT, Time::Location::UTC)
  end
end
