defmodule Slaks.Repo do
  use Ecto.Repo,
    otp_app: :slaks,
    adapter: Ecto.Adapters.Postgres
end
