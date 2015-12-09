defmodule AdventOfCode.Day5Test do
  use ExUnit.Case, async: false
  alias AdventOfCode.Day5

  test "an empty string is not nice" do
    refute Day5.nice?("")
  end

  test "a string with two vowels is not nice" do
    refute Day5.nice?("aibb")
  end

  test "a string with three vowels is nice" do
    assert Day5.nice?("aeibb")
  end

  test "a string with four vowels is nice" do
    assert Day5.nice?("aeiubb")
  end

  test "a string with no letter twice in a row is not nice" do
    refute Day5.nice?("baei")
  end

  test "a string with at least one letter twice in a row is nice" do
    assert Day5.nice?("bbaei")
  end

  test "a string with an illegal sequence is not nice" do
    refute Day5.nice?("abiocc")
    refute Day5.nice?("cdoiocc")
    refute Day5.nice?("pqoiocc")
    refute Day5.nice?("xyoiocc")
  end

  test "full test" do
    assert Day5.nice?("ugknbfddgicrmopn")
    assert Day5.nice?("aaa")
    refute Day5.nice?("jchzalrnumimnmhp")
    refute Day5.nice?("haegwjzuvuyypxyu")
    refute Day5.nice?("dvszwmarrgswjxmb")
  end
end
