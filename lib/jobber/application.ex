defmodule Jobber.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    job_runner_config = [
      strategy: :one_for_one,
      max_seconds: 30_000,
      name: Jobber.JobRunner
    ]

    children = [
      # enforce all registry keys to be unique
      {Registry, keys: :unique, name: Jobber.JobRegistry},
      {DynamicSupervisor, job_runner_config}
    ]

    opts = [strategy: :one_for_one, name: Jobber.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
