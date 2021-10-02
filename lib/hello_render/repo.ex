defmodule HelloRender.Repo do
  use Ecto.Repo,
    otp_app: :hello_render,
    adapter: Ecto.Adapters.Postgres
end
