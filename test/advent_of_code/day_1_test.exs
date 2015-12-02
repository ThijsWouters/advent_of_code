defmodule AdventOfCode.Day1Test do
  use ExUnit.Case, async: true
  doctest AdventOfCode.Day1

  import AdventOfCode.Day1

  test "an empty string is zero" do
    assert solve("") == 0
  end

  test "an opening parentheses adds a floor" do
    assert solve("(") == 1
  end

  test "a closing parentheses subtracts a floor" do
    assert solve(")") == -1
  end
end
