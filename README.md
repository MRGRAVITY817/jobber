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
