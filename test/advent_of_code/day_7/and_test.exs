defmodule AdventOfCode.Day7.ANDTest do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day7
  alias AdventOfCode.Day7.AND
  alias AdventOfCode.Day7.Wire
  alias AdventOfCode.Day7.Signal

  test "parse" do
    assert Day7.parse_gate("x AND y") == %AND{a: %Wire{name: "x"}, b: %Wire{name: "y"}}
  end

  test "parse with signal" do
    assert Day7.parse_gate("5 AND 3") == %AND{a: %Signal{value: 5}, b: %Signal{value: 3} }
  end
end
