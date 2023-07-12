defmodule Jobber do
  @moduledoc """
  Documentation for `Jobber`.
  """
  alias Jobber.Boundary.JobSupervisor
  alias Jobber.JobRunner

  def start_job(args) do
    DynamicSupervisor.start_child(JobRunner, {JobSupervisor, args})
  end

  def running_imports() do
    match_all = {:"$1", :"$2", :"$3"}
    guards = [{:==, :"$3", "import"}]
    map_result = [%{id: :"$1", pid: :"$2", type: :"$3"}]

    Registry.select(Jobber.JobRegistry, [{match_all, guards, map_result}])
  end
end
