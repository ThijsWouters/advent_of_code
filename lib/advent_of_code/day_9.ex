defmodule AdventOfCode.Day9 do
  alias AdventOfCode.Day9.Towns

  def shortest_route(input) do
    routes_with_distance(input)
    |> Enum.min_by(fn {_, distance} -> distance end)
  end

  def longest_route(input) do
    routes_with_distance(input)
    |> Enum.max_by(fn {_, distance} -> distance end)
  end

  defp routes_with_distance(input) do
    routes = parse(input) |> build_routes
    parse(input)
    |> all_towns
    |> Permutations.permute
    |> Enum.map(fn route ->
      {route, total_distance(route, routes)}
    end)
  end

  defp total_distance([], _), do: 0
  defp total_distance([head|tail], routes) do
    total_distance(head, tail, routes)
  end

  defp total_distance(_, [], _), do: 0
  defp total_distance(town_1, [town_2 | rest], routes) do
    Towns.distance(routes, town_1, town_2) + total_distance(town_2, rest, routes)
  end

  defp parse(input) do
    input
    |> String.split("\n")
    |> Enum.map(&Regex.named_captures(~r/(?<town_1>.+) to (?<town_2>.+) = (?<distance>.+)/, &1))
  end

  defp build_routes(input) do
    Enum.reduce(input, Towns.new, fn %{"town_1" => town_1, "town_2" => town_2, "distance" => distance}, routes ->
      Towns.add_route(routes, town_1, town_2, to_i(distance))
    end)
  end

  defp to_i(string) do
    case Integer.parse(string) do
      {result, ""} -> result
    end
  end

  defp all_towns(input) do
    Enum.reduce(input, [], fn %{"town_1" => town_1, "town_2" => town_2}, towns ->
      Enum.concat(towns, [town_1, town_2])
    end)
    |> Enum.uniq
  end
end
