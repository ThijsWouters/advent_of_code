defmodule AdventOfCode.Day17 do
  def different_combinations(input, eggnog) do
    String.split(input, "\n")
    |> Enum.map(&String.to_integer/1)
    |> all_combinations
    |> Enum.filter(fn combination -> Enum.sum(combination) == eggnog end)
    |> length
  end

  def all_combinations([]), do: []
  def all_combinations(list = [_]), do: [list]
  def all_combinations([head|rest]) do
    [[head]]
    |> Enum.concat(all_combinations(rest))
    |> Enum.concat(Enum.map(all_combinations(rest), &List.insert_at(&1, 0, head)))
  end
end
