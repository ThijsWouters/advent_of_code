defmodule AdventOfCode.Day19Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day19
  alias AdventOfCode.Day19.Replacement

  test "when e then returns zero" do
    assert Day19.reverse("e", []) == 0
  end

  test "when 1 possible replacement" do
    assert Day19.reverse("Ac", [%Replacement{from: "e", to: "Ac"}]) == 1
  end

  test "it takes the first match" do
    assert Day19.reverse("Ac", [
      %Replacement{from: "e", to: "Ac"},
      %Replacement{from: "Ac", to: "Ac"},
    ]) == 1
  end

  test "multiple steps" do
    assert Day19.reverse("At", [
      %Replacement{from: "e", to: "Ac"},
      %Replacement{from: "Ac", to: "At"},
    ]) == 2
  end

  test "each match is a separate step" do
    assert Day19.reverse("AcAcAcAc", [
      %Replacement{from: "Ac", to: "AcAc"},
      %Replacement{from: "e", to: "Ac"},
    ]) == 4
  end
end
