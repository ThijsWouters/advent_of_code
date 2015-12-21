defmodule AdventOfCode.Day15 do
  alias AdventOfCode.Day15.Ingredient
  alias AdventOfCode.Day15.Cookie

  def best_cookie(input, total) do
    String.split(input, "\n")
    |> Enum.map(&Ingredient.parse/1)
    |> Cookie.build(total)
    |> Enum.map(fn cookie -> {cookie, Cookie.score(cookie)} end)
    |> Enum.max_by(&elem(&1, 1))
  end
end
