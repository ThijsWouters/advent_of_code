defmodule AdventOfCode.Day16.Sue do
  alias __MODULE__

  defstruct [:number, :properties]

  def parse(string) do
    Regex.named_captures(~r/Sue (?<number>\d+): (?<key1>.+): (?<value1>\d+), (?<key2>.+): (?<value2>\d+), (?<key3>.+): (?<value3>\d+)/, string)
    |> from
  end

  def from(%{"number" => number, "key1" => key1, "value1" => value1, "key2" => key2, "value2" => value2, "key3" => key3, "value3" => value3}) do
    properties = Dict.put(%{}, key1, String.to_integer(value1))
    |> Dict.put(key2, String.to_integer(value2))
    |> Dict.put(key3, String.to_integer(value3))
    %Sue{number: number, properties: properties}
  end

  def matches?(sue, "cats", amount) do
    matches?(sue, "cats", amount, fn value, amount -> value > amount end)
  end
  def matches?(sue, "trees", amount) do
    matches?(sue, "trees", amount, fn value, amount -> value > amount end)
  end
  def matches?(sue, "pomeranians", amount) do
    matches?(sue, "pomeranians", amount, fn value, amount -> value < amount end)
  end
  def matches?(sue, "goldfish", amount) do
    matches?(sue, "goldfish", amount, fn value, amount -> value < amount end)
  end

  def matches?(sue, property, amount, check \\ (fn value, amount -> value == amount end)) do
    case Dict.fetch(sue.properties, property) do
      {:ok, value} -> check.(value, amount)
      :error -> true
    end
  end
end
