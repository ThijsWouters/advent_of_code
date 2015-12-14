defmodule AdventOfCode.Day7.SignalTest do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day7
  alias AdventOfCode.Day7.Signal
  alias AdventOfCode.Day7.Gate

  test "parse" do
    assert Day7.parse_gate("123") == %Signal{value: 123}
  end

  test "print" do
    assert Gate.print(%Signal{value: 12}, %{}) == "12"
  end
end
