defmodule Ethos.Repo.Migrations.CreateDocument do
  use Ecto.Migration

  def change do
    create table(:document, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :icon, :string
      add :type, :string
			add :tenant_id, references(:tenant)

      timestamps()
    end
  end
end
