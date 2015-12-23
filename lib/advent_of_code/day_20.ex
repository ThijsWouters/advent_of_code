defmodule AdventOfCode.Day20 do
  alias AdventOfCode.Day20.House

  def lowest_house(presents) do
    Stream.iterate(1, &(&1+1))
    |> Stream.map(fn house ->
      {house, House.presents(house)}
    end)
    |> Enum.find(fn {_, presents_delivered} -> presents_delivered >= presents end)
  end
end
