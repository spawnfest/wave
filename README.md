# Wave

A horizontally distributed ledger. Wave builds on two key components:

1. It implements the invariants and data structures necessary to do simple double-entry accounting using
 postgreSQL as a storage layer.
2. It wraps this state machine over the consensus protocol RAFT via rabbitmq/ra.
3. It exposes an api interface to read/write to the ledger.

## High Level Goals

- There are three nodes - a single leader and two followers
- It will accept writes (CREATE TABLE, INSERT) on the leader and
- accept reads (SELECT) on any node. All nodes will always contain the same data.
- Supported Ledger Operations:

1. create a ledger
2. create more than one account on the ledger
2. add a CR entry
3. add a DR entry
3. retrieve a balance

## Plan of Attack/ Lay of the Land

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
