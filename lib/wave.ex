defmodule Wave do
  @moduledoc """
  Documentation for `Wave`.

  Operations:

  1. create a ledger (only one provided by default)
  2. create more than one account on the ledger
  3. add a CR entry
  4. add a DR entry
  5. retrieve a balance
  """

  def create_account(_ledger_type) do
    nil
  end

  def create_credit_entry(_cr_account_id, _dr_account_id, _amount) do
    nil
  end

  def create_debit_entry(_cr_account_id, _dr_account_id, _amount) do
    nil
  end

  def account_balance(_account_id) do
    nil
  end
end
