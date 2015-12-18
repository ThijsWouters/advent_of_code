defmodule AdventOfCode.Day14 do
  alias AdventOfCode.Day14.Reindeer

  def winner(input, seconds) when is_binary(input) do
    String.split(input, "\n")
    |> Enum.map(&Reindeer.parse/1)
    |> winners(seconds)
    |> Enum.map(fn reindeer ->
      {reindeer.name, Reindeer.distance_after(reindeer, seconds)}
    end)
  end

  def winners(reindeer, seconds) when is_list(reindeer) do
    reindeer
    |> Enum.filter(fn single ->
      Reindeer.distance_after(single, seconds) == winning_distance(reindeer, seconds)
    end)
  end

  defp winning_distance(reindeer, seconds) do
    reindeer
    |> Enum.map(&Reindeer.distance_after(&1, seconds))
    |> Enum.max
  end
end
