defmodule Whatismikedoingnow.Repo do
  use Ecto.Repo,
    otp_app: :whatismikedoingnow,
    adapter: Ecto.Adapters.Postgres
end
