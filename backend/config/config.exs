# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :ethos,
  ecto_repos: [Ethos.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :ethos, EthosWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "33Y7JpN+88IxfCNlh9uFk6bClY/lRSrNO7bS9bcu++quMVcMHBKcahgdw5YgEm21",
  render_errors: [view: EthosWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Ethos.PubSub,
  live_view: [signing_salt: "DK6veIWr"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
