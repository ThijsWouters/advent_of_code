defmodule AdventOfCode.Day7.Signal do
  defstruct [:value]
end

defimpl AdventOfCode.Day7.Gate, for: AdventOfCode.Day7.Signal do
  def print(%AdventOfCode.Day7.Signal{value: value}, _) do
    to_string(value)
  end

  def signal?(_), do: true

  def solve(signal, _) do
    signal
  end
end
