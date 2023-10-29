defmodule Wave.StateMachine do
  @moduledoc false

  @behaviour :ra_machine

  # Client API
  def get(server_id, key) do
    :ra.process_command(server_id, {:get, key})
  end

  def put(server_id, key, value) do
    :ra.process_command(server_id, {:put, key, value})
  end

  # Cluster Management
  def start do
    members = get_active_nodes()
    machine_config = [:module, __MODULE__, %{}]

    :ra.start_cluster(:wave_ledger, machine_config, members)
  end

  def replace_member do
  end

  # State Machine
  def init(_config) do
    %{}
  end

  def apply(_command_meta_data, {:get, key},  state) do
    result = Map.get(state, key, :not_found)

    {state, result}
  end

  def apply(_command_meta_data, {:put, key, value}, state) do
    {Map.put(state, key, value), :inserted}
  end

  defp get_active_nodes do
    Node.list()
    |> Enum.zip([1, 2, 3])
    |> Enum.map(fn {n, hostname} -> {:"ledger#{n}", hostname} end)
  end
end
