defmodule WaveTest do
  use ExUnit.Case
  doctest Wave

  test "greets the world" do
    assert Wave.hello() == :world
  end
end
