defmodule AdventOfCode.Day6.GridTest do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day6.Grid

  test "turn on all" do
    grid = Grid.act(Grid.new(2, 2), :turn_on, {0, 0}, {1, 1})
    assert grid == [
      [1, 1],
      [1, 1]
    ]
  end

  test "turn on first row" do
    grid = Grid.act(Grid.new(2, 2), :turn_on, {0, 0}, {0, 1})
    assert grid == [
      [1, 1],
      [0, 0]
    ]
  end

  test "turn on last row" do
    grid = Grid.act(Grid.new(2, 2), :turn_on, {1, 0}, {1, 1})
    assert grid == [
      [0, 0],
      [1, 1]
    ]
  end

  test "turn on first column" do
    assert Grid.act(Grid.new(2, 2), :turn_on, {0, 0}, {1, 0}) == [
      [1, 0],
      [1, 0]
    ]
  end

  test "turn on last column" do
    assert Grid.act(Grid.new(2, 2), :turn_on, {0, 1}, {1, 1}) == [
      [0, 1],
      [0, 1]
    ]
  end

  test "turn on 1 cell" do
    assert Grid.act(Grid.new(3, 3), :turn_on, {1, 1}, {1, 1}) == [
      [0, 0, 0],
      [0, 1, 0],
      [0, 0, 0],
    ]
  end
end
