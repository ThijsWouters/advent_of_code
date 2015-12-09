defmodule AdventOfCode.Day5Test do
  use ExUnit.Case, async: false
  alias AdventOfCode.Day5

  test "a pair of two letters appears at least twice (no overlap)" do
    assert Day5.nice?("xyxy")
    assert Day5.nice?("aabcdefegaa")
    refute Day5.nice?("aaa")
  end

  test "it repeats a character with one character inbetween" do
    assert Day5.nice?("xyxy")
    assert Day5.nice?("abcdefeghixyxy")
    refute Day5.nice?("abcdefghixyaxy")
  end
end
