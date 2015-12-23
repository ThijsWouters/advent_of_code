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

  def steps(input) do
    {molecule, replacements} = String.split(input, "\n")
                                |> parse([])
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
    IO.puts reverse(molecule, Enum.shuffle(replacements))
  end

  def reverse(molecule, replacements, steps \\ 0)
  def reverse("e", _, steps), do: steps
  def reverse(molecule, replacements, steps) do
    case Enum.find(replacements, fn %Replacement{to: to} ->
      String.contains?(molecule, to)
    end) do
      %Replacement{from: from, to: to} ->
        reverse(String.replace(molecule, to, from, global: false), replacements, steps + 1)
      nil ->
        molecule
    end
  end

  def parse([molecule], replacements), do: { molecule, replacements }
  def parse([""|tail], replacements), do: parse(tail, replacements)
  def parse([head|tail], replacements) do
    parse(tail, List.insert_at(replacements, -1, Replacement.parse(head)))
  end
end
