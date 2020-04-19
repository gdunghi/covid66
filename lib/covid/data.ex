defmodule Covid.Data do
  alias Covid.Virus.Info
  alias Covid.Repo

  def list_viruses do
    Info
    |> Repo.all()
  end

  def get_virus_by_code (code) do
    Info
    |> Repo.get_by(code: code)
  end

  def create_virus(attrs \\ %{}) do
    %Info{}
    |> Info.changeset(attrs)
    |> Repo.insert()
  end


  def update_virus (virus) do
    Info
    |> Repo.update(virus)
  end

  def change_virus(%Info{} = info) do
    Info.changeset(info, %{})
  end

  def update_virus(%Info{} = info, attrs) do
    info
    |> Info.changeset(attrs)
    |> Repo.update()
  end

end
