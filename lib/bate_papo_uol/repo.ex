defmodule BatePapoUol.Repo do
  use Ecto.Repo,
    otp_app: :bate_papo_uol,
    adapter: Ecto.Adapters.Postgres
end
