defmodule BatePapoUol.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BatePapoUol.Repo,
      # Start the Telemetry supervisor
      BatePapoUolWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BatePapoUol.PubSub},
      # Start the Endpoint (http/https)
      BatePapoUolWeb.Endpoint
      # Start a worker by calling: BatePapoUol.Worker.start_link(arg)
      # {BatePapoUol.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BatePapoUol.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BatePapoUolWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
