# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :porkchop,
  ecto_repos: [Porkchop.Repo]

# Configures the endpoint
config :porkchop, PorkchopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5g/wmVTN2mfFlx60WE8rT905zWFDv8rfPd79JZiG493qrNWuZNB5zxZNKJzTlbJ1",
  render_errors: [view: PorkchopWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Porkchop.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
