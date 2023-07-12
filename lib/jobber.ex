defmodule Jobber do
  @moduledoc """
  Documentation for `Jobber`.
  """
  alias Jobber.Boundary.JobSupervisor
  alias Jobber.JobRunner

  def start_job(args) do
    DynamicSupervisor.start_child(JobRunner, {JobSupervisor, args})
  end
end
