# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hello_render,
  ecto_repos: [HelloRender.Repo]

# Configures the endpoint
config :hello_render, HelloRenderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HyAH+KYs8iaY0QPSpS0EcdsCuJ22uq6FzPlHPq0D9U0kfj0aIcB12zxF1ok6W8vi",
  render_errors: [view: HelloRenderWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HelloRender.PubSub,
  live_view: [signing_salt: "oHFn9WA1"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
