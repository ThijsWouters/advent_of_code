defmodule AdventOfCode.Day12 do
  def sum_all_numbers(input) do
    Regex.scan(~r/-?\d+/, input)
    |> List.flatten
    |> Enum.map(fn number ->
      {integer, ""} = Integer.parse(number)
      integer
    end)
    |> Enum.sum
  end
end
