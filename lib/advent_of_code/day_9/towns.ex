defmodule AdventOfCode.Day9.Towns do
  def new do
    %{}
  end

  def add_route(towns, town_1, town_2, distance) do
    towns
    |> Dict.put({town_1, town_2}, distance)
    |> Dict.put({town_2, town_1}, distance)
  end

  def distance(towns, town_1, town_2) do
    Dict.get(towns, {town_1, town_2})
  end
end
