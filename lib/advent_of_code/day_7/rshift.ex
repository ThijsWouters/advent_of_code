defmodule AdventOfCode.Day7.RSHIFT do
  defstruct [:a, :value]
end

defimpl AdventOfCode.Day7.Gate, for: AdventOfCode.Day7.RSHIFT do
  alias AdventOfCode.Day7.Gate
  alias AdventOfCode.Day7.Signal
  alias AdventOfCode.Day7.Wire
  alias AdventOfCode.Day7.RSHIFT
  require Bitwise

  def print(%AdventOfCode.Day7.RSHIFT{a: a, value: value}, circuit) do
    "#{Gate.print(a, circuit)} RSHIFT #{Gate.print(value, circuit)}"
  end

  def signal?(_), do: false

  def solve(%RSHIFT{a: %Signal{value: a}, value: %Signal{value: value}}, _) do
    %Signal{value: Bitwise.bsr(a, value)}
  end
  def solve(gate = %RSHIFT{a: a = %Wire{}, value: _}, signals) do
    %RSHIFT{gate | a: Gate.solve(a, signals)}
  end

  def solve(gate = %RSHIFT{a: _, value: value = %Wire{}}, signals) do
    %RSHIFT{gate | value: Gate.solve(value, signals)}
  end
  def solve(gate, _), do: gate
end
