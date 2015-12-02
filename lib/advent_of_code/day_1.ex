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

  @doc """
  iex> AdventOfCode.Day1.part_2(")")
  1

  iex> AdventOfCode.Day1.part_2("()())")
  5
  """
  def part_2(input) when is_binary(input), do: part_2(String.graphemes(input), [], 0)

  defp part_2([], [], _acc), do: nil
  defp part_2([], _check, acc), do: acc
  defp part_2([head | tail], check, acc) do
    if solve(check, 0) >= 0 do
      part_2(tail, Enum.concat(check, [head]), acc + 1)
    else
      acc
    end
  end
end
