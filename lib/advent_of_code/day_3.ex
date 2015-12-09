defmodule AdventOfCode.Day3 do
  alias AdventOfCode.Day3.Movement

  def at_least_one_present(input) do
    input
    |> Movement.parse
    |> visited_houses
    |> count_unique_houses
  end

  def visited_houses(movements) do
    visited_houses(movements, {0, 0}, [])
  end

  defp visited_houses([], current_house, houses_visited) do
    Enum.concat(houses_visited, [current_house])
  end

  defp visited_houses([head|tail], current_house, houses_visited) do
    visited_houses(
      tail,
      Movement.move(current_house, head),
      Enum.concat(houses_visited, [current_house]))
  end

  defp count_unique_houses(houses) do
    houses
    |> Enum.uniq
    |> Enum.count
  end
end
