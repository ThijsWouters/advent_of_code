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

  def sum_all_number_except_red(input) do
    Poison.Parser.parse!(input)
    |> sum
  end

  defp sum(list) when is_list(list) do
    Enum.reduce(list, 0, fn element, acc ->
      sum(element) + acc
    end)
  end

  defp sum(string) when is_binary(string) do
    0
  end

  defp sum(number) when is_number(number) do
    number
  end

  defp sum(map = %{}) do
    values = Map.values(map)
    if Enum.member?(values, "red") do
      0
    else
      sum(values)
    end
  end
end
