defmodule AdventOfCode.Day7.AND do
  defstruct [:a, :b]
end

defimpl AdventOfCode.Day7.Gate, for: AdventOfCode.Day7.AND do
  alias AdventOfCode.Day7.Gate
  alias AdventOfCode.Day7.Signal
  alias AdventOfCode.Day7.Wire
  alias AdventOfCode.Day7.AND
  require Bitwise

  def print(%AdventOfCode.Day7.AND{a: a, b: b}, circuit) do
    "#{Gate.print(a, circuit)} AND #{Gate.print(b, circuit)}"
  end

  def signal?(_), do: false

  def solve(%AND{a: %Signal{value: a}, b: %Signal{value: b}}, _) do
    %Signal{value: Bitwise.band(a, b)}
  end

  def solve(gate = %AND{a: a = %Wire{}, b: _}, signals) do
    %AND{gate | a: Gate.solve(a, signals)}
  end

  def solve(gate = %AND{a: _, b: b = %Wire{}}, signals) do
    %AND{gate | b: Gate.solve(b, signals)}
  end

  def solve(gate, _) do
    gate
  end
end
