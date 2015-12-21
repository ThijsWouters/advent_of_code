defmodule AdventOfCode.Day15.Ingredient do
  alias __MODULE__

  defstruct [:name, :capacity, :durability, :flavor, :texture, :calories]

  def parse(string) do
    Regex.named_captures(~r/^(?<name>.*): capacity (?<capacity>-?\d), durability (?<durability>-?\d), flavor (?<flavor>-?\d), texture (?<texture>-?\d), calories (?<calories>-?\d)$/, string)
    |> from
  end

  def from(%{
    "name" => name,
    "capacity" => capacity,
    "durability" => durability,
    "flavor" => flavor,
    "texture" => texture,
    "calories" => calories
  }) do
    %Ingredient {
      name: name,
      capacity: String.to_integer(capacity),
      durability: String.to_integer(durability),
      flavor: String.to_integer(flavor),
      texture: String.to_integer(texture),
      calories: String.to_integer(calories)
    }
  end
end
