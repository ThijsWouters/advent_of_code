defmodule AdventOfCode.Day21.CharacterTest do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day21.Character

  test "damage a character" do
    assert Character.damage(
      %Character{hit_points: 3},
      %Character{damage: 1}
    ) == %Character{hit_points: 2}
  end

  test "armor reduces damage" do
    assert Character.damage(
      %Character{hit_points: 3, armor: 1},
      %Character{damage: 2}
    ) == %Character{hit_points: 2, armor: 1}
  end

  test "damage is at least 1" do
    assert Character.damage(
      %Character{hit_points: 3, armor: 2},
      %Character{damage: 2}
    ) == %Character{hit_points: 2, armor: 2}
  end

  test "dead character has zero or less hitpoints" do
    assert Character.dead?(%Character{hit_points: 0})
    assert Character.dead?(%Character{hit_points: -1})
  end

  test "character is not dead with more than zero hitpoints" do
    refute Character.dead?(%Character{hit_points: 1})
  end

  test "fight returns the attacker" do
    assert Character.fight(
      %Character{name: "1", hit_points: 1, damage: 1},
      %Character{name: "2", hit_points: 1, damage: 1}
    ).name == "1"
  end

  test "fight returns the defender" do
    assert Character.fight(
      %Character{name: "1", hit_points: 1, damage: 1},
      %Character{name: "2", hit_points: 2, damage: 1}
    ).name == "2"
  end
end
