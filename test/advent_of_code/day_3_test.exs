defmodule AdventOfCode.Day3Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day3

  test "no input is 1" do
    assert Day3.at_least_one_present("") == 1
  end

  test "> is 2" do
    assert Day3.at_least_one_present(">") == 2
  end

  test "^>v< is 4" do
    assert Day3.at_least_one_present("^>v<") == 4
  end

  test "^v^v^v^v^v is 2" do
    assert Day3.at_least_one_present("^v^v^v^v^v") == 2
  end

  test "[] is [{0, 0}]" do
    assert Day3.visited_houses([]) == [{0, 0}]
  end

  test "> is [{0, 0}, {0, 1}]" do
    assert Day3.visited_houses([">"]) == [{0, 0}, {0, 1}]
  end

  test "^>v< is [{0, 0}, {-1, 0}, {-1, 1}, {0, 1}, {0, 0}]" do
    assert Day3.visited_houses(["^", ">", "v", "<"]) == [{0, 0}, {-1, 0}, {-1, 1}, {0, 1}, {0, 0}]
  end
end
