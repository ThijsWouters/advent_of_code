defmodule AdventOfCode.Day21Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day21

  test "join empty lists" do
    assert Day21.join([], []) == []
  end

  test "join one empty list" do
    assert Day21.join([], [:a]) == []
    assert Day21.join([:a], []) == []
  end

  test "join one element with one element" do
    assert Day21.join([:a], [:b]) == [[:a, :b]]
  end

  test "join one element with two elements" do
    assert Day21.join([:a, :b], [:c]) == [[:a, :c], [:b, :c]]
    assert Day21.join([:a], [:b, :c]) == [[:a, :b], [:a, :c]]
  end

  test "join two elements with two elements" do
    assert Day21.join([:a, :b], [:c, :d]) == [[:a, :c], [:a, :d], [:b, :c], [:b, :d]]
  end
end
