defmodule Ethos.Application do
  # https://hexdocs.pm/elixir/Application.html
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Ethos.Repo,
      # Start the Telemetry supervisor
      EthosWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ethos.PubSub},
      # Start the Endpoint (http/https)
      EthosWeb.Endpoint
      # Start a worker by calling: Ethos.Worker.start_link(arg)
      # {Ethos.Worker, arg}
    ]

    # https://hexdocs.pm/elixir/Supervisor.html
    opts = [strategy: :one_for_one, name: Ethos.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EthosWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
