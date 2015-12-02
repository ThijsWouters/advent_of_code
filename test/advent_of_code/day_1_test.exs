defmodule AdventOfCode.Day1Test do
  use ExUnit.Case, async: true
  doctest AdventOfCode.Day1

  import AdventOfCode.Day1

  test "an empty string is zero" do
    assert floor("") == 0
  end

  test "an opening parentheses adds a floor" do
    assert floor("(") == 1
  end

  test "a closing parentheses subtracts a floor" do
    assert floor(")") == -1
  end

  test "an empty string is :never" do
    assert first_time_in_basement("") == :never
  end

  test "can be never" do
    assert first_time_in_basement("(") == :never
  end

  test "a lone closing parentheses gives 1" do
    assert first_time_in_basement(")") == 1
  end

  test "multiple closing parentheses gives 1" do
    assert first_time_in_basement(")))))") == 1
  end

  test "return when first in basement" do
    assert first_time_in_basement("())") == 3
  end
end
