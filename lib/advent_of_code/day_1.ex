defmodule AdventOfCode.Day1 do
  def solve([]), do: 0
  def solve(input) when is_binary(input), do: solve(String.graphemes(input))
  def solve(["(" | tail]), do: solve(tail) + 1
  def solve([")" | tail]), do: solve(tail) - 1
end
