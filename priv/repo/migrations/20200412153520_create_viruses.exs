defmodule Covid.Repo.Migrations.CreateViruses do
  use Ecto.Migration

  def change do
    create table(:viruses) do
      add :code, :string
      add :name, :string
      add :description, :string

      timestamps()
    end
  end
end
