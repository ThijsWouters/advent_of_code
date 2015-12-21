defmodule AdventOfCode.Day15.IngredientTest do
  use ExUnit.Case, async: true

  alias AdventOfCode.Day15.Ingredient

  test "it has a capacity score" do
    assert %Ingredient{capacity: 15}.capacity
  end

  test "it has a durability score" do
    assert %Ingredient{durability: 12}.durability
  end

  test "it has a flavor score" do
    assert %Ingredient{flavor: 13}.flavor
  end

  test "it has a texture score" do
    assert %Ingredient{texture: 14}.texture
  end

  test "it has a calories score" do
    assert %Ingredient{calories: 16}.calories
  end

  test "it has a name" do
    assert %Ingredient{name: "Salt"}.name
  end

  test "parse from string" do
    assert Ingredient.parse("Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8") ==
    %Ingredient {
      name: "Butterscotch",
      capacity: -1,
      durability: -2,
      flavor: 6,
      texture: 3,
      calories: 8
    }
  end
end
