defmodule AdventOfCode.Day11Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day11

  test "the next password of a is b" do
    assert Day11.password("a") == "b"
  end

  test "the next password of z is a" do
    assert Day11.password("z") == "a"
  end

  test "the next password of aa is ab" do
    assert Day11.password("aa") == "ab"
  end

  test "the next password of az is ba" do
    assert Day11.password("az") == "ba"
  end

  test "the next password of hhzzskzz is hhzzslaa" do
    assert Day11.password("hhzzskzz") == "hhzzslaa"
  end

  test "ddkkabc is a valid password" do
    assert Day11.valid?("ddkkabc")
  end

  test "ddkkabd is not a valid password" do
    refute Day11.valid?("ddkkabd")
  end

  test "ddkkzab is not a valid password" do
    refute Day11.valid?("ddkkzab")
  end

  test "ddkkyza is not a valid password" do
    refute Day11.valid?("ddkkyza")
  end

  test "ddkkabci is not a valid password" do
    refute Day11.valid?("ddkkabci")
  end

  test "ddkkabco is not a valid password" do
    refute Day11.valid?("ddkkabco")
  end

  test "ddkkabcl is not a valid password" do
    refute Day11.valid?("ddkkabcl")
  end

  test "aabbcd is a valid password" do
    assert Day11.valid?("aabbcd")
  end

  test "aabcdaa is not a valid password" do
    refute Day11.valid?("aabcdaa")
  end

  test "aabcddaa is a valid password" do
    assert Day11.valid?("aabcddaa")
  end

  test "aabcdaadd is a valid password" do
    assert Day11.valid?("aabcdaadd")
  end
end
