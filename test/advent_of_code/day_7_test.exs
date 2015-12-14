defmodule AdventOfCode.Day7Test do
  use ExUnit.Case
  alias AdventOfCode.Day7
  alias AdventOfCode.Day7.Signal
  alias AdventOfCode.Day7.Wire
  alias AdventOfCode.Day7.OR
  alias AdventOfCode.Day7.LSHIFT
  alias AdventOfCode.Day7.RSHIFT
  alias AdventOfCode.Day7.NOT

  test "OR gate" do
    assert Day7.parse_gate("x OR y") == %OR{a: %Wire{name: "x"}, b: %Wire{name: "y"}}
  end

  test "LSHIFT gate" do
    assert Day7.parse_gate("x LSHIFT 2") == %LSHIFT{a: %Wire{name: "x"}, value: %Signal{value: 2}}
  end

  test "RSHIFT gate" do
    assert Day7.parse_gate("x RSHIFT 2") == %RSHIFT{a: %Wire{name: "x"}, value: %Signal{value: 2}}
  end

  test "NOT gate" do
    assert Day7.parse_gate("NOT x") == %NOT{a: %Wire{name: "x"}}
  end

end
