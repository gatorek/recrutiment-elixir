# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :gamecode, GamecodeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qO1F2Q12DCHzKda5K35eU+uIQB4j2FPtLPq2lXPoiQfQ+F3UE7M/mCm289GVjj03",
  render_errors: [view: GamecodeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gamecode.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :gamecode, :google_api_key, "PUT YOUR GOOGLE API KEY HERE"
