defmodule AdventOfCode.Day3 do
  alias AdventOfCode.Day3.Movement

  def at_least_one_present(input) do
    input
    |> String.graphemes
    |> visited_places
    |> Enum.uniq
    |> Enum.count
  end

  def visited_places(movements) do
    visited_places(movements, {0, 0}, [])
  end

  defp visited_places([], current, visited), do: Enum.concat(visited, [current])
  defp visited_places([head|tail], current, visited) do
    visited_places(
      tail,
      Movement.move(current, head),
      Enum.concat(visited, [current]))
  end
end
