defmodule Covid.Virus.Info do
  #defstruct [:code, :name, :description]
  use Ecto.Schema
  import Ecto.Changeset

  schema "viruses" do
    field :code, :string
    field :name, :string
    field :description, :string

    timestamps()
  end

  def changeset(virus, attrs) do
    virus
    |> cast(attrs, [:code, :name, :description])
  end
end
