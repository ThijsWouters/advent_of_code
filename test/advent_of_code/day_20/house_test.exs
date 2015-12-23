defmodule AdventOfCode.Day20.HouseTest do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day20.House

  test "house 1 gets 11 presents" do
    assert House.presents(1) == 11
  end

  test "house 2 gets 33 presents" do
    assert House.presents(2) == 33
  end

  test "house 3 gets 44 presents" do
    assert House.presents(3) == 44
  end

  test "house 4 gets 77 presents" do
    assert House.presents(4) == 77
  end

  test "house 8 gets 165 presents" do
    assert House.presents(8) == 165
  end

  test "house 50 gets 1023 presents" do
    assert House.presents(50) == 1023
  end

  test "house 51 gets 792 presents" do
    assert House.presents(51) == 781
  end
end
