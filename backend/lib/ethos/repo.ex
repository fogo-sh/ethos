defmodule Ethos.Repo do
  use Ecto.Repo,
    otp_app: :ethos,
    adapter: Ecto.Adapters.SQLite3
end
