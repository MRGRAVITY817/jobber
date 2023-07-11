defmodule Jobber do
  @moduledoc """
  Documentation for `Jobber`.
  """
  alias Jobber.Core.Job
  alias Jobber.JobRunner

  def start_job(args) do
    DynamicSupervisor.start_child(JobRunner, {Job, args})
  end
end
