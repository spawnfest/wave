defmodule Wave.StateMachine do
  @moduledoc false

  @behaviour :ra_machine

  # Client API
  def get(server_id, key) do
    :ra.process_command(server_id, {:get_transaction, key})
  end

  def put(server_id, key, value) do
    #state = %{cr: cr, dr: dr, amount: amount, type: type, desc: desc}
    :ra.process_command(server_id, {:put, key, value})
  end

  # Cluster Management
  def start do
    members = get_active_nodes()
    machine_config = {__MODULE__, %{}}

    :ra.start_cluster(:default, "wave_ledger", machine_config, members)
  end

  # State Machine
  def init(_config) do
    %{}
  end

  def apply(_command_meta_data, {:get_transaction, id}, state) do
    query = "SELECT id FROM ledger_transactions WHERE id = $1"

    result =
      Postgrex.transaction(:wave_ledger, fn conn ->
        Postgrex.query(conn, query, [id])
      end)

    case result do
      {:ok, %Postgrex.Result{rows: rows}} -> {state, rows}
      {:error, _e} -> {state, :not_found}
    end
  end

  def apply(_command_meta_data, {:put, id, transition}, state) do
    %{cr: cr, dr: dr, amount: amount, type: type, desc: desc} = transition

    query = """
    INSERT INTO ledger_transactions
    (cr_account_id, dr_account_id, amount, ledger_type, timestamp, description)
    VALUES ($1, $2, $3, $4, $5, $6)
    """

    timestamp = DateTime.utc_now() |> DateTime.to_unix()

    result =
      Postgrex.transaction(:wave_ledger, fn conn ->
        Postgrex.query(conn, query, [cr, dr, amount, type, timestamp, desc])
      end)

    case result do
      {:ok, %Postgrex.Result{rows: rows}} -> {state, rows}
      {:error, :rollback} -> raise "oh no transaction rollback"
      {:error, _e} -> {state, :not_found}
    end
  end

  def get_active_nodes do
    true = Node.connect(:"wave-two@127.0.0.1")
    true = Node.connect(:"wave-three@127.0.0.1")

    Node.list()
    |> Enum.zip([1, 2])
    |> Enum.map(fn {hostname, n} -> {:"ledger#{n}", hostname} end)
  end
end
