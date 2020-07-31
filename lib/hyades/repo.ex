defmodule Hyades.Repo do
  use Ecto.Repo,
    otp_app: :hyades,
    adapter: Ecto.Adapters.Postgres
end
