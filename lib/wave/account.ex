defmodule Wave.Account do
  @moduledoc """
    An account represents a party and a counter-party to
    a %Wave.Transaction{}
  """
  @type t :: %__MODULE__{
    id: String.t(),
    ledger: :accounts_payable | :accounts_receivable,
    metadata: map()
  }

  defstruct id: "", ledger: "", metadata: %{}
end
