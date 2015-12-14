defmodule AdventOfCode.Day7.OR do
  defstruct [:a, :b]
end

defimpl AdventOfCode.Day7.Gate, for: AdventOfCode.Day7.OR do
  alias AdventOfCode.Day7.Gate
  alias AdventOfCode.Day7.OR
  alias AdventOfCode.Day7.Signal
  alias AdventOfCode.Day7.Wire
  require Bitwise

  def print(%AdventOfCode.Day7.OR{a: a, b: b}, circuit) do
    "#{Gate.print(a, circuit)} OR #{Gate.print(b, circuit)}"
  end

  def signal?(_), do: false

  def solve(%OR{a: %Signal{value: a}, b: %Signal{value: b}}, _) do
    %Signal{value: Bitwise.bor(a, b)}
  end

  def solve(gate = %OR{a: a = %Wire{}, b: _}, signals) do
    %OR{gate | a: Gate.solve(a, signals)}
  end

  def solve(gate = %OR{a: _, b: b = %Wire{}}, signals) do
    %OR{gate | b: Gate.solve(b, signals)}
  end

  def solve(gate, _), do: gate
end
