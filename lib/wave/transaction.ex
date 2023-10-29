defmodule Wave.Transaction do
  @moduledoc """
    A transaction represents a single double-entry accounting
    record between two or more accounts.
  """

  @type t :: %__MODULE__{
    id: String.t(),
    cr_account_id: String.t(),
    dr_account_id: String.t(),
    amount: pos_integer(),
    ledger_type: :accounts_payable | :accounts_receivable,
    timestamp: DateTime.t(),
    description: String.t()
  }

  defstruct id: nil,
            cr_account_id: "",
            dr_account_id: "",
            amount: "",
            ledger_type: "",
            timestamp: nil,
            description: ""
end
