# Jobber

Let's practice GenServer with Supervisor.

## WIL

### GenServer restarts

When we declare `use GenServer` it's automatically set to option `restart: :permanent` - which will automatically restart when process has stopped.

If you don't want to restart it, explicitly set to `use GenServer, restart: :transient`.

### JobRunner settings

- `strategy`: how it will handle when child process is in trouble.
- `max_restarts`: default to 3
- `max_seconds`: default to 5

### Process naming

You can name process with `:name` option.

```elixir
children = [
  {
    DynamicSupervisor,
    strategy: :one_for_one,
    name: Jobber.JobRunner # <- Here
  }
]
```

It accepts three types of values:

- `atom`: (ex) `:job_runner` or Jobber.JobRunner
- `{:global, term}`: Registers the process globally. Useful for distriubuted applications. (ex) `{:global, :job_runner}`
- `{:via, module, term}`: `module` is an Elixir module that would take care of the registration process.

### `Register` module

Naming process with atoms has limits - Elixir program has limits of numbers for saving atoms.

`Register` module allow us to name process with normal string. It also provides features like looking up process by its name and filtering it.
