defmodule AdventOfCode.Day3.MovementTest do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day3.Movement

  test "^ moves up" do
    assert Movement.move({0, 0}, "^") == {-1, 0}
  end

  test "v moves down" do
    assert Movement.move({0, 0}, "v") == {1, 0}
  end

  test "< moves left" do
    assert Movement.move({0, 0}, "<") == {0, -1}
  end

  test "> moves right" do
    assert Movement.move({0, 0}, ">") == {0, 1}
  end
end
