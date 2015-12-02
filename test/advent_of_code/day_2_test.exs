defmodule AdventOfCode.Day2Test do
  use ExUnit.Case, async: true
  import AdventOfCode.Day2
  doctest AdventOfCode.Day2

  test "an empty string is zero" do
    assert paper("") == 0
  end

  test "a zero by zero by zero package is zero" do
    assert paper("0x0x0") == 0
  end

  test "multiple lines are split" do
    assert paper("""
0x0x0
0x0x0
""") == 0
  end

  test "1x1x1 is 7" do
    assert paper("1x1x1") == 7
  end
end
