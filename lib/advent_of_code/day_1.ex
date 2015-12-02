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
  def solve(input) when is_binary(input), do: solve(String.graphemes(input), 0)
  defp solve([], acc), do: acc
  defp solve(["(" | tail], acc), do: solve(tail, acc + 1)
  defp solve([")" | tail], acc), do: solve(tail, acc - 1)
end
