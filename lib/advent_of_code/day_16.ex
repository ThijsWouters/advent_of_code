defmodule AdventOfCode.Day16 do
  alias AdventOfCode.Day16.Sue

  def which_sue(input) do
    String.split(input, "\n")
    |> Enum.map(&Sue.parse/1)
    |> Enum.filter(&Sue.matches?(&1, "children", 3))
    |> Enum.filter(&Sue.matches?(&1, "cats", 7))
    |> Enum.filter(&Sue.matches?(&1, "samoyeds", 2))
    |> Enum.filter(&Sue.matches?(&1, "pomeranians", 3))
    |> Enum.filter(&Sue.matches?(&1, "akitas", 0))
    |> Enum.filter(&Sue.matches?(&1, "vizslas", 0))
    |> Enum.filter(&Sue.matches?(&1, "goldfish", 5))
    |> Enum.filter(&Sue.matches?(&1, "trees", 3))
    |> Enum.filter(&Sue.matches?(&1, "cars", 2))
    |> Enum.filter(&Sue.matches?(&1, "perfumes", 1))
  end
end
