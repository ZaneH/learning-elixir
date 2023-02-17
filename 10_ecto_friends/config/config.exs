import Config

config :friends_ecto_10, Friends.Repo,
  database: "ecto_demos",
  username: "demo",
  password: "demo",
  hostname: "localhost"

config :friends_ecto_10, ecto_repos: [Friends.Repo]
