defmodule AdventOfCode.Day2 do
  @doc """
  iex> solve("2x3x4")
  58

  iex> solve("1x1x10")
  43
  """
  def solve(input) when is_binary(input) do
    String.split(input, "\n")
    |> solve
  end

  def solve([]), do: 0
  def solve([head | tail]) do
    solve_one(head) + solve(tail)
  end

  defp solve_one(""), do: 0
  defp solve_one(package) when is_binary(package) do
    String.split(package, "x")
    |> Enum.map(fn string ->
      case Integer.parse(string) do
        {int, ""} -> int
        {_, _} -> raise "Not all are integer: '#{string}'"
        :error -> raise "Error: '#{string}'"
      end
    end)
    |> amount_of_wrapping_paper
  end

  defp amount_of_wrapping_paper([l, h, w]) do
    first = l * h
    second = l * w
    third = h * w
    2*first + 2*second + 2*third + Enum.min([first, second, third])
  end
end
