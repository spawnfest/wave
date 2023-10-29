defmodule WaveTest do
  use ExUnit.Case
  doctest Wave

  describe "account_creation" do
    test "it creates an account on a ledger" do
      assert Wave.create_account(:accounts_payable) == nil
    end

    test "it creates more than one account on a ledger" do
      assert Wave.create_account(:accounts_recievable) == nil
    end
  end

  describe "transactions" do
    test "it creates a balanced CR/DR entry" do
      assert Wave.create_credit_entry("test", "test-two", 5000) == nil
    end

    test "it creates a balanced DR/CR entry" do
      assert Wave.create_debit_entry("test", "test-two", 5000) == nil
    end

    test "it retrieves a balance" do
      assert Wave.account_balance("test") == nil
    end
  end
end
