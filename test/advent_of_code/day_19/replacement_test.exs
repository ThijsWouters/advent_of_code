defmodule AdventOfCode.Day19.ReplacementTest do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day19.Replacement

  setup do
    {:ok, replacement: %Replacement{from: "Ac", to: "De"}}
  end

  test "a replacement has a from", %{replacement: replacement} do
    assert replacement.from
  end

  test "a replacement has a to", %{replacement: replacement} do
    assert replacement.to
  end

  test "from is not present in string", %{replacement: replacement} do
    assert Replacement.replace(replacement, "abcd") == []
  end

  test "from is present once in the string", %{replacement: replacement} do
    assert Replacement.replace(replacement, "aAcB") == ["aDeB"]
  end

  test "from is present twice in the string", %{replacement: replacement} do
    assert Replacement.replace(replacement, "aAcBAcd") == [
      "aDeBAcd",
      "aAcBDed",
    ]
  end

  test "from is present thrice in the string", %{replacement: replacement} do
    assert Replacement.replace(replacement, "aAcBAcdAcT") == [
      "aDeBAcdAcT",
      "aAcBDedAcT",
      "aAcBAcdDeT",
    ]
  end

  test "parsing from a string" do
    assert Replacement.parse("Al => ThF") == %Replacement{from: "Al", to: "ThF"}
  end
end
