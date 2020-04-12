defmodule CovidWeb.VirusView do
  use CovidWeb, :view
  alias Covid.Virus.Info
  def covid_19 do
    "COVID"
  end
  def upper_case_name(%Info{name: name}) do
    name
    |> String.replace(" ", "")
    |> String.upcase
  end
end
