defmodule AdventOfCode.Day16.SueTest do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day16.Sue

  test "a Sue has a number" do
    assert %Sue{number: "1"}.number
  end

  test "a Sue has properties" do
    assert %Sue{properties: %{}}.properties
  end

  test "a Sue matches when property is present and matches" do
    assert Sue.matches?(%Sue{properties: %{"cars" => 3}}, "cars", 3)
  end

  test "a Sue does match when property is present and does match" do
    refute Sue.matches?(%Sue{properties: %{"cars" => 3}}, "cars", 4)
  end

  test "a Sue matches when property is not present" do
    assert Sue.matches?(%Sue{properties: %{"perfume" => 3}}, "cars", 3)
  end

  test "parse Sue from string" do
    assert Sue.parse("Sue 4: trees: 4, vizslas: 4, goldfish: 9") ==
    %Sue {
      number: "4", properties: %{
        "trees" => 4,
        "vizslas" => 4,
        "goldfish" => 9,
      }
    }
  end
end
