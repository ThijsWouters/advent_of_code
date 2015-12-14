defmodule AdventOfCode.Day7 do
  alias AdventOfCode.Day7.Gate
  alias AdventOfCode.Day7.Signal
  alias AdventOfCode.Day7.Wire
  alias AdventOfCode.Day7.AND
  alias AdventOfCode.Day7.OR
  alias AdventOfCode.Day7.LSHIFT
  alias AdventOfCode.Day7.RSHIFT
  alias AdventOfCode.Day7.NOT

  def parse_circuit(input) do
    String.split(input, "\n")
    |> Enum.map(&Regex.named_captures(~r/^(?<gate>.+) -> (?<output>.+)$/, &1))
    |> Enum.reduce(%{}, fn %{"gate" => gate, "output" => output}, acc -> Dict.put(acc, output, parse_gate(gate)) end)
  end

  def parse_gate(gate) do
    case Regex.named_captures(~r/^((?<value>\d+)|(?<a>.*) (?<gate>(AND|OR|LSHIFT|RSHIFT)) (?<b>.*)|NOT (?<c>.*))$/, gate) do
      %{"value" => value, "a" => "", "b" => "", "c" => ""} ->
        case Integer.parse(value) do
          {value, ""} -> %Signal{value: value}
          error -> {:error, error}
        end
      %{"value" => "", "a" => a, "b" => b, "gate" => "AND"} ->
        %AND{a: parse_gate(a), b: parse_gate(b)}
      %{"value" => "", "a" => a, "b" => b, "gate" => "OR"} ->
        %OR{a: parse_gate(a), b: parse_gate(b)}
      %{"value" => "", "a" => a, "b" => b, "gate" => "LSHIFT"} ->
        %LSHIFT{a: parse_gate(a), value: parse_gate(b)}
      %{"value" => "", "a" => a, "b" => b, "gate" => "RSHIFT"} ->
        %RSHIFT{a: parse_gate(a), value: parse_gate(b)}
      %{"value" => "", "a" => "", "b" => "", "c" => c} ->
        %NOT{a: parse_gate(c)}
      _ -> %Wire{name: gate}
    end
  end

  def solve(circuit) do
    if all_signal?(circuit) do
      circuit
    else
      signals = get_signals(circuit)
      Dict.to_list(circuit)
      |> Enum.map(fn {key, value} ->
        {key, Gate.solve(value, signals)}
      end)
      |> to_map
      |> solve
    end
  end

  defp all_signal?(circuit) do
    Enum.all?(Dict.values(circuit), &Gate.signal?/1)
  end

  defp get_signals(circuit) do
    Dict.to_list(circuit)
    |> Enum.filter(fn {_, value} -> Gate.signal?(value) end)
    |> to_map
  end

  defp to_map(list) do
    Enum.reduce(list, %{}, fn {key, value}, acc -> Dict.put(acc, key, value) end)
  end
end
