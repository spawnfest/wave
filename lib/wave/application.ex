defmodule Wave.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  @spec start(any(), any()) :: {:error, any()} | {:ok, pid()}
  def start(_type, _args) do
    # TODO: clean up config
    # TODO: setup datbase creation
    hostname = Application.get_env(:wave, :hostname, "localhost")
    database = Application.get_env(:wave, :database, "wave_ledger")
    password = Application.get_env(:wave, :password, "postgres")

    config = [
      name: :wave_ledger,
      hostname: hostname,
      database: database,
      password: password,
      pool_size: 10
    ]

    children = [
      {Postgrex, config}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wave.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
