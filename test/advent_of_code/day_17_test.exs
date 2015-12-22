defmodule AdventOfCode.Day17Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day17

  test "an empty list stays empty" do
    assert Day17.all_combinations([]) == []
  end

  test "a list with one item is a list with that item" do
    assert Day17.all_combinations([:a]) == [
      [:a]
    ]
  end

  test "a list with two items is both items and each of them" do
    assert Day17.all_combinations([:a, :b]) == [
      [:a],
      [:b],
      [:a, :b],
    ]
  end

  test "a list with three items" do
    assert Day17.all_combinations([:a, :b, :c]) == [
      [:a],
      [:b],
      [:c],
      [:b, :c],
      [:a, :b],
      [:a, :c],
      [:a, :b, :c],
    ]
  end
end
