defmodule AdventOfCode.Day3.Movement do
  def parse(string) do
    string
    |> String.graphemes
  end

  def move({x, y}, "^"), do: {x - 1, y}
  def move({x, y}, "v"), do: {x + 1, y}
  def move({x, y}, "<"), do: {x, y - 1}
  def move({x, y}, ">"), do: {x, y + 1}
end
