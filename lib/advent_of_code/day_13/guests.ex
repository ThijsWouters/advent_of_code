defmodule AdventOfCode.Day13.Guests do
  def new do
    %{}
  end

  def all(guests) do
    Map.keys(guests)
    |> Enum.map(&Tuple.to_list/1)
    |> List.flatten
    |> Enum.uniq
  end

  def add(guests, guest_1, guest_2, happiness) do
    Map.put(guests, {guest_1, guest_2}, happiness)
  end

  def happiness(guests, guest_1, guest_2) do
    Map.get(guests, {guest_1, guest_2})
  end
end
