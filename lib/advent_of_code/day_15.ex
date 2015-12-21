defmodule AdventOfCode.Day15 do
  alias AdventOfCode.Day15.Ingredient
  alias AdventOfCode.Day15.Cookie

  def best_cookie(input, total) do
    recipes(input, total)
    |> Enum.map(fn cookie -> {cookie, Cookie.score(cookie)} end)
    |> Enum.max_by(&elem(&1, 1))
  end

  def best_cookie(input, total, calories) do
    recipes(input, total)
    |> Enum.filter(fn cookie -> Cookie.property_score(cookie, :calories) == 500 end)
    |> Enum.map(fn cookie -> {cookie, Cookie.score(cookie)} end)
    |> Enum.max_by(&elem(&1, 1))
  end

  defp recipes(input, total) do
    String.split(input, "\n")
    |> Enum.map(&Ingredient.parse/1)
    |> Cookie.build(total)
  end
end
