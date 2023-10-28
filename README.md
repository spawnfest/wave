# Wave

A horizontally distributed ledger - via a REST API. Wave builds on two key components:

1. It implements the invariants and data structures necessary to do simple double-entry accounting over postgreSQL.
2. It wraps this state machine over the consensus protocol RAFT via rabbitmq/ra.

## Setup

The application must be able to connect to a postgres database called `wave_ledger`. Via `psql`:

```zsh
psql -U user
postgres=# CREATE DATABASE wave_ledger;
CREATE DATABASE
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `wave` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:wave, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/wave>.
