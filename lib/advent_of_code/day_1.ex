defmodule AdventOfCode.Day1 do
  @doc """
  iex> AdventOfCode.Day1.solve("(())")
  0

  iex> AdventOfCode.Day1.solve("()()")
  0

  iex> AdventOfCode.Day1.solve("(((")
  3

  iex> AdventOfCode.Day1.solve("(()(()(")
  3

  iex> AdventOfCode.Day1.solve("))(((((")
  3

  iex> AdventOfCode.Day1.solve("())")
  -1

  iex> AdventOfCode.Day1.solve("))(")
  -1

  iex> AdventOfCode.Day1.solve(")))")
  -3

  iex> AdventOfCode.Day1.solve(")())())")
  -3
  """
  def solve([]), do: 0
  def solve(input) when is_binary(input), do: solve(String.graphemes(input))
  def solve(["(" | tail]), do: solve(tail) + 1
  def solve([")" | tail]), do: solve(tail) - 1
end
