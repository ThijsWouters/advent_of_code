defmodule AdventOfCode.Day21.Character do
  defstruct [:name, hit_points: 0, armor: 0, damage: 0]
  alias __MODULE__

  def damage(character = %Character{hit_points: hit_points, armor: armor}, %Character{damage: damage}) do
    damage = Enum.max([damage - armor, 1])
    %Character{character | hit_points: hit_points - damage}
  end

  def dead?(%Character{hit_points: hit_points}) do
    hit_points <= 0
  end

  def fight(attacker, defender) do
    if dead?(attacker) do
      defender
    else
      fight(damage(defender, attacker), attacker)
    end
  end
end
