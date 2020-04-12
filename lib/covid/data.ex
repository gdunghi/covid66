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
end
