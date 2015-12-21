defmodule AdventOfCode.Day15.CookieTest do
  alias AdventOfCode.Day15.Cookie
  alias AdventOfCode.Day15.Ingredient

  use ExUnit.Case, async: true

  setup do
    {:ok,
      cinnamon: %Ingredient {
        name: "Cinnamon",
        capacity: 2,
        durability: 3,
        flavor: -2,
        texture: -1,
        calories: 3,
      },
      butterscotch: %Ingredient {
        name: "Butterscotch",
        capacity: -1,
        durability: -2,
        flavor: 6,
        texture: 3,
        calories: 8,
      },
    }
  end

  test "a cookie has a score", %{cinnamon: cinnamon, butterscotch: butterscotch} do
    recipe = %{}
    |> Dict.put(butterscotch, 44)
    |> Dict.put(cinnamon, 56)
    assert Cookie.score(recipe) == 62842880
  end

  test "build with 1 ingredient 1 teaspoon" do
    assert Cookie.build([:a], 1) == [
      %{a: 1}
    ]
  end

  test "build with 2 ingredients 1 teaspoon" do
    assert Cookie.build([:a, :b], 1) == [
      %{a: 1, b: 0},
      %{a: 0, b: 1},
    ]
  end

  test "build with 2 ingredients 2 teaspoon" do
    assert Cookie.build([:a, :b], 2) == [
      %{a: 2, b: 0},
      %{a: 1, b: 1},
      %{a: 0, b: 2},
    ]
  end

  test "build with 3 ingredients 1 teaspoon" do
    assert Cookie.build([:a, :b, :c], 2) == [
      %{a: 2, b: 0, c: 0},
      %{a: 1, b: 1, c: 0},
      %{a: 1, b: 0, c: 1},
      %{a: 0, b: 2, c: 0},
      %{a: 0, b: 1, c: 1},
      %{a: 0, b: 0, c: 2},
    ]
  end
end
