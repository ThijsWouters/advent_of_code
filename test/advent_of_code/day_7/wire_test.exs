defmodule AdventOfCode.Day7.WireTest do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day7
  alias AdventOfCode.Day7.Wire
  alias AdventOfCode.Day7.Signal
  alias AdventOfCode.Day7.Gate

  test "parse" do
    assert Day7.parse_gate("x") == %Wire{name: "x"}
  end

  test "print with no input" do
    assert Gate.print(%Wire{name: "a"}, %{}) == "a"
  end

  test "print with input" do
    assert Gate.print(%Wire{name: "a"}, %{"a" => %Signal{value: 12}}) == "(12)"
  end
end
