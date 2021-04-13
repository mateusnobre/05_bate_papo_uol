# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bate_papo_uol,
  ecto_repos: [BatePapoUol.Repo]

# Configures the endpoint
config :bate_papo_uol, BatePapoUolWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8UiJ94dD120BMxHiFzx/cupyuBd2EWMSxrjlLKAq90ZkxIkPjz7VzpUehWk4zK/H",
  render_errors: [view: BatePapoUolWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BatePapoUol.PubSub,
  live_view: [signing_salt: "9TbKVFB9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
