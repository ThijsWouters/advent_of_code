defmodule AdventOfCode.Day14 do
  alias AdventOfCode.Day14.Reindeer

  def winner(input, seconds) do
    String.split(input, "\n")
    |> Enum.map(&Reindeer.parse/1)
    |> Enum.map(fn reindeer -> {reindeer.name, Reindeer.distance_after(reindeer, seconds)} end)
    |> Enum.max_by(fn {_, distance} -> distance end)
  end
end
