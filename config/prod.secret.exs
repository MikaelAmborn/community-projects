use Mix.Config

defmodule Heroku do
  def database_config(uri) do
    parsed_uri = URI.parse(uri)
    [username, password] = parsed_uri.userinfo
                           |> String.split(":")
    [_, database] = parsed_uri.path
                    |> String.split("/")

    [{:username, username},
     {:password, password},
     {:hostname, parsed_uri.host},
     {:database, database},
     {:port, parsed_uri.port},
     {:adapter, Ecto.Adapters.Postgres}]
  end
end

config :community_projects, CommunityProjects.Repo,
  "DATABASE_URL"
  |> System.get_env
  |> Heroku.database_config

config :community_projects, CommunityProjects.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

