defmodule AdventOfCode.Day19 do
  alias AdventOfCode.Day19.Replacement

  def distinct_molecules(input) do
    {molecule, replacements} = String.split(input, "\n")
                                |> parse([])
    Enum.map(replacements, &Replacement.replace(&1, molecule))
    |> List.flatten
    |> Enum.uniq
    |> Enum.count
  end

  def parse([molecule], replacements), do: { molecule, replacements }
  def parse([""|tail], replacements), do: parse(tail, replacements)
  def parse([head|tail], replacements) do
    parse(tail, List.insert_at(replacements, -1, Replacement.parse(head)))
  end
end
