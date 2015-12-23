defmodule AdventOfCode.Day21 do
  alias AdventOfCode.Day21.Character

  def least_gold do
    shop
    |> Enum.map(fn {cost, damage, armor} ->
      {cost, %Character{name: :player, hit_points: 100, damage: damage, armor: armor}}
    end)
    |> Enum.sort_by(fn {cost, _} -> cost end)
    |> Enum.find(fn {_, player} ->
      Character.fight(player, boss).name == :player
    end)
  end

  def most_gold do
    shop
    |> Enum.map(fn {cost, damage, armor} ->
      {cost, %Character{name: :player, hit_points: 100, damage: damage, armor: armor}}
    end)
    |> Enum.sort_by(fn {cost, _} -> -cost end)
    |> Enum.find(fn {_, player} ->
      Character.fight(player, boss).name == :boss
    end)
  end

  defp boss do
    %Character{name: :boss, hit_points: 109, damage: 8, armor: 2}
  end

  def shop do
    weapons = [
      {8, 4, 0},
      {10, 5, 0},
      {25, 6, 0},
      {40, 7, 0},
      {74, 8, 0},
    ]
    armor = [
      {0, 0, 0},
      {13, 0, 1},
      {31, 0, 2},
      {53, 0, 3},
      {75, 0, 4},
      {102, 0, 5},
    ]
    rings = [
      {0, 0, 0},
      {0, 0, 0},
      {25, 1, 0},
      {50, 2, 0},
      {100, 3, 0},
      {20, 0, 1},
      {40, 0, 2},
      {80, 0, 3},
    ]
    |> Permutations.permute
    |> Enum.map(&Enum.take(&1, 2))
    |> Enum.map(&Enum.sort_by(&1, fn {cost, _, _} -> cost end))
    |> Enum.uniq
    |> join(armor)
    |> join(weapons)
    |> Enum.map(&List.flatten/1)
    |> Enum.map(&Enum.reduce(&1, fn {cost, damage, armor}, {total_cost, total_damage, total_armor} ->
      {total_cost + cost, total_damage + damage, total_armor + armor}
    end))
  end

  def join(list1, list2, acc \\ [])
  def join([], [], acc), do: acc
  def join([], _, acc), do: acc
  def join(_, [], acc), do: acc
  def join([head|rest], list, acc) do
    acc = Enum.reduce(list, acc, fn element, acc ->
      List.insert_at(acc, -1, [head, element])
    end)
    join(rest, list, acc)
  end
end
