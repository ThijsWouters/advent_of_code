defmodule AdventOfCode.Day7.NOT do
  defstruct [:a]
end

defimpl AdventOfCode.Day7.Gate, for: AdventOfCode.Day7.NOT do
  alias AdventOfCode.Day7.Gate
  alias AdventOfCode.Day7.Signal
  alias AdventOfCode.Day7.Wire
  alias AdventOfCode.Day7.NOT

  def print(%NOT{a: a}, circuit) do
    "NOT #{Gate.print(a, circuit)}"
  end

  def signal?(_), do: false

  def solve(%NOT{a: %Signal{value: value}}, _) do
    require Bitwise
    %Signal{value: Bitwise.bnot(value)}
  end
  def solve(gate = %NOT{a: a = %Wire{}}, signals) do
    %NOT{gate | a: Gate.solve(a, signals)}
  end
  def solve(gate, _), do: gate
end
