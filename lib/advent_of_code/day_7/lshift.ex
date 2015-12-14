defmodule AdventOfCode.Day7.LSHIFT do
  defstruct [:a, :value]
end

defimpl AdventOfCode.Day7.Gate, for: AdventOfCode.Day7.LSHIFT do
  alias AdventOfCode.Day7.Gate
  alias AdventOfCode.Day7.Signal
  alias AdventOfCode.Day7.Wire
  alias AdventOfCode.Day7.LSHIFT
  require Bitwise

  def print(%AdventOfCode.Day7.LSHIFT{a: a, value: value}, circuit) do
    "#{Gate.print(a, circuit)} LSHIFT #{Gate.print(value, circuit)}"
  end

  def signal?(_), do: false

  def solve(%LSHIFT{a: %Signal{value: a}, value: %Signal{value: value}}, _) do
    %Signal{value: Bitwise.bsl(a, value)}
  end

  def solve(gate = %LSHIFT{a: a = %Wire{}, value: _}, signals) do
    %LSHIFT{gate | a: Gate.solve(a, signals)}
  end

  def solve(gate = %LSHIFT{a: _, value: value = %Wire{}}, signals) do
    %LSHIFT{gate | value: Gate.solve(value, signals)}
  end

  def solve(gate, _), do: gate
end
