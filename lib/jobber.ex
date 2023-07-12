defmodule Jobber do
  @moduledoc """
  Documentation for `Jobber`.
  """
  alias Jobber.Boundary.JobSupervisor
  alias Jobber.JobRunner

  def start_job(args) do
    # Do not run more than 5 import-type processes
    if Enum.count(running_imports()) >= 5 do
      {:error, :import_quota_reached}
    else
      DynamicSupervisor.start_child(JobRunner, {JobSupervisor, args})
    end
  end

  def running_imports() do
    match_all = {:"$1", :"$2", :"$3"}
    guards = [{:==, :"$3", "import"}]
    map_result = [%{id: :"$1", pid: :"$2", type: :"$3"}]

    Registry.select(Jobber.JobRegistry, [{match_all, guards, map_result}])
  end
end
