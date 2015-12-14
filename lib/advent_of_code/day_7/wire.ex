defmodule AdventOfCode.Day7.Wire do
  defstruct [:name]
end

defimpl AdventOfCode.Day7.Gate, for: AdventOfCode.Day7.Wire do
  alias AdventOfCode.Day7.Gate
  alias AdventOfCode.Day7.Wire

  def print(%Wire{name: name}, circuit) do
    if Dict.has_key?(circuit, name) do
      "(#{Gate.print(Dict.get(circuit, name), circuit)})"
    else
      name
    end
  end

  def signal?(_), do: false

  def solve(wire = %Wire{name: name}, signals) do
    Dict.get(signals, name, wire)
  end
end
