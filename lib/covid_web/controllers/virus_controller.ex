defmodule CovidWeb.VirusController do
  use CovidWeb, :controller
  alias Covid.Data
  alias Covid.Virus.Info

  def index(conn, _params) do
    viruses = Data.list_viruses
    render(conn, "index.html", viruses: viruses)
  end

  def new(conn, _params) do
    changeset = Data.change_virus(%Info{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"info" => virus_params}) do
    case Data.create_virus(virus_params) do
      {:ok, virus} ->
        conn
        |> put_flash(:info, "#{virus.name} created!")
        |> redirect(to: Routes.virus_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} -> render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"code" => code}) do
    virus = Data.get_virus_by_code(code)
    render(conn, "show.html", virus: virus)
  end

  def edit(conn, %{"code" => code}) do
    virus = Data.get_virus_by_code(code)
    changeset = Data.change_virus(virus)
    render(conn, "edit.html", virus: virus, changeset: changeset)
  end

  def update(conn, %{"code" => code, "info" => virus_params}) do
    virus = Data.get_virus_by_code(code)
    case Data.update_virus(virus, virus_params) do
      {:ok, virus} ->
        conn
        |> put_flash(:info, "virus updated successfully.")
        |> redirect(to: Routes.virus_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} -> render(conn, "edit.html", virus: virus, changeset: changeset)
    end


  end
end
