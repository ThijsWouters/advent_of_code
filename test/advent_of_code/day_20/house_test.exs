defmodule AdventOfCode.Day20.HouseTest do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day20.House

  test "house 1 gets 10 presents" do
    assert House.presents(1) == 10
  end

  test "house 2 gets 30 presents" do
    assert House.presents(2) == 30
  end

  test "house 3 gets 40 presents" do
    assert House.presents(3) == 40
  end

  test "house 4 gets 70 presents" do
    assert House.presents(4) == 70
  end

  test "house 8 gets 150 presents" do
    assert House.presents(8) == 150
  end
end
