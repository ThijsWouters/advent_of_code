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

  test "an empty string is nil" do
    assert part_2("") == nil
  end

  test "a lone closing parentheses gives 1" do
    assert part_2(")") == 1
  end

  test "multiple closing parentheses gives 1" do
    assert part_2(")))))") == 1
  end

  test "return when first in basement" do
    assert part_2("())") == 3
  end
end
