defmodule AdventOfCode.Day15.Cookie do
  def score(cookie) do
    property_score(cookie, :capacity) *
    property_score(cookie, :durability) *
    property_score(cookie, :flavor) *
    property_score(cookie, :texture)
  end

  def property_score(cookie, property) do
    Enum.map(cookie, fn {ingredient, amount} ->
      amount * Map.get(ingredient, property)
    end)
    |> Enum.sum
    |> List.wrap
    |> Enum.concat([0])
    |> Enum.max
  end

  def build([ingredient], total) do
    [Dict.put(%{}, ingredient, total)]
  end

  def build([head|tail], total) do
    Enum.reduce(0..total, [], fn number, recipes ->
      Enum.map(build(tail, total - number), fn recipe ->
        Dict.put(recipe, head, number)
      end)
      |> Enum.concat(recipes)
    end)
  end
end
