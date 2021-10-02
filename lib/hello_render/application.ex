defmodule HelloRender.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      HelloRender.Repo,
      # Start the Telemetry supervisor
      HelloRenderWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HelloRender.PubSub},
      # Start the Endpoint (http/https)
      HelloRenderWeb.Endpoint
      # Start a worker by calling: HelloRender.Worker.start_link(arg)
      # {HelloRender.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloRender.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HelloRenderWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
