# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hackhatchy,
  ecto_repos: [Hackhatchy.Repo]

# Configures the endpoint
config :hackhatchy, HackhatchyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RBKt87Xv4BI1+lwxUo3RuJ6h0DFKdAZHbalAxSiScuA2NlgMRSiDB+F2u8n7lGxX",
  render_errors: [view: HackhatchyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hackhatchy.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
