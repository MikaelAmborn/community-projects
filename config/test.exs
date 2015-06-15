use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :community_projects, CommunityProjects.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :community_projects, CommunityProjects.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "ma",
  password: "",
  database: "community_projects_test",
  size: 1 # Use a single connection for transactional tests
