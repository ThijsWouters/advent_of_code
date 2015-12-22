defmodule AdventOfCode.Day18 do
  alias AdventOfCode.Day18.Grid

  def solve(input, steps) do
    String.split(input, "\n")
    |> Enum.map(fn row ->
      String.graphemes(row)
      |> Enum.map(fn
        "#" -> 1
        "." -> 0
      end)
    end)
    |> Grid.new
    |> next(steps)
    |> Map.get(:data)
    |> Tuple.to_list
    |> Enum.map(&Tuple.to_list/1)
    |> List.flatten
    |> Enum.sum
  end

  defp next(grid, 0), do: grid
  defp next(grid, n) do
    next(Grid.next(grid), n-1)
  end
end
