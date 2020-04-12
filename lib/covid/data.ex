defmodule Covid.Data do
  alias Covid.Virus.Info
  def list_viruses do
    [
      %Info{code: "001", name: "covid 19"},
      %Info{code: "002", name: "sar 20"},
      %Info{code: "003", name: "ebola 21"}
    ]
  end

  def get_virus_by_code (code) do
    viruses = list_viruses
    Enum.find(viruses, fn x -> x.code == code end)
  end
end
